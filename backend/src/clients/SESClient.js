'use strict';

const SES = require('aws-sdk/clients/ses');

class SESClient {

  constructor(email) {
    this.email = email;
    this.client = new SES();
    console.log(`[SESClient] Using email '${email}'`);
  }

  async sendEmail(subject, body) {
    try {
      const params = {
        Destination: {
          ToAddresses: [this.email]
        },
        Message: {
          Body: {
            Text: {
              Data: (typeof body === 'string')
                ? body
                : JSON.stringify(body, null, 2)
            }
          },
          Subject: {
            Data: subject
          }
        },
        Source: this.email
      }

      const data = await this.client.sendEmail(params).promise();
      console.log(`'Sent email to '${this.email}: ${data}`); // TMP
    } catch(e) {
      throw new Error(`Failed to send email to '${this.email}':\n ${e}`);
    }
  }

}

module.exports = SESClient;
