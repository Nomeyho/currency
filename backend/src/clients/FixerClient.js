'use strict';

const got = require('got');

const BASE_URL = 'http://data.fixer.io/api';

class FixerClient {

  constructor(accessKey) {
    this.accessKey = accessKey;
    console.log(`[FixerClient] Using API Key: ${this.hiddenKey()}`)
  }

  async getLatestRates(baseCurrency = 'EUR') {
    try {
      const response = await got(`${BASE_URL}/latest`, {
        query: {
          'access_key': this.accessKey,
          base: baseCurrency
        }
      });
      const body = JSON.parse(response.body);
      return {
        date: body.date,
        rates: body.rates,
      };
    } catch(e) {
      throw new Error(`Failed to get rates:\n ${e}`);
    }
  }

  hiddenKey() {
    if(!this.accessKey) {
      return this.accessKey;
    }
    return this.accessKey.slice(-4).padStart(this.accessKey.length, '*');
  }

}

module.exports = FixerClient;
