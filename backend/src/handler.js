'use strict';

const FixerClient = require('./clients/FixerClient');
const S3Client = require('./clients/S3Client');
const SESClient = require('./clients/SESClient');
const { toResponse } = require('./utils');

const fixerClient = new FixerClient(process.env.FIXER_API_KEY);
const s3Client = new S3Client(process.env.REGION, process.env.BUCKET_NAME);
const sesClient = new SESClient(process.env.EMAIL);

module.exports.refresh = async (event, context) => {
  try {
    console.log(`${event.httpMethod} ${event.path} (${event.requestContext.identity.sourceIp})`);

    const { date, rates } = await fixerClient.getLatestRates();
    const url = await s3Client.save('rates.json', rates);
    const response = { url, date, rates }

    await sesClient.sendEmail(`[Currency] rates updated - ${date}`, response);
    return toResponse(200, response);
  } catch(e) {
    console.error(e);    
    await sesClient.sendEmail(`[Currency] failed to update rates`, e);
    return toResponse(500, { error: e.message });
  }
};
