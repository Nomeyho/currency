'use strict';

const currencies = require('../resources/currencies.json');

module.exports.toResponse = (code, body) => ({
  statusCode: code,
  body: JSON.stringify({
    timestamp: new Date().getTime(),
    code,
    body,
  })
});

module.exports.toCurrency = function (rates) {
  const result = [];
  const skipped = [];

  for(const code of Object.keys(rates)) {
    const currency = currencies[code];

    if(currency) {
      result.push({
        code,
        rate: rates[code],
        symbol: currency.symbol,
        name: currency.name
      });
    } else {
      skipped.push(code);
    }
  }

  console.warn(`Skipped currencies: ${skipped}`);  
  return result;
};
