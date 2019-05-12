'use strict';

const FixerClient = require('./clients/FixerClient');
const S3Client = require('./clients/S3Client');
const SESClient = require('./clients/SESClient');
const { toCurrency, toResponse } = require('./utils');

const fixerClient = new FixerClient(process.env.FIXER_API_KEY);
const s3Client = new S3Client(process.env.REGION, process.env.BUCKET_NAME);
const sesClient = new SESClient(process.env.EMAIL);

module.exports.refresh = async (event, context) => {
  try {
    const { date, rates } = await fixerClient.getLatestRates();
    const currencies = toCurrency(rates);
    const url = await s3Client.save('currencies.json', { date, currencies });

    const response = { url, date, currencies };
    await sesClient.sendEmail(`[Currency] rates updated - ${date}`, response);
    return toResponse(200, response);
  } catch(e) {
    console.error(e);    
    await sesClient.sendEmail(`[Currency] failed to update rates`, e);
    return toResponse(500, { error: e.message });
  }
};
