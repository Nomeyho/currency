'use strict';

module.exports.toResponse = (code, body) => ({
  statusCode: code,
  body: JSON.stringify({
    timestamp: new Date().getTime(),
    code,
    body,
  })
});