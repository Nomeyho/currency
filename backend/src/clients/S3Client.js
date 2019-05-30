'use strict';

const S3 = require('aws-sdk/clients/s3');

class S3Client {

  constructor(region, bucketName) {
    this.region = region;
    this.bucketName = bucketName;
    this.client = new S3();
    console.log(`[S3Client] Using bucket '${bucketName}'`);
  }

  async save(filename, content) {
    try {
      const { ETag } = await this.client.putObject({
        Body: (typeof content === 'string')
          ? content
          : JSON.stringify(content, null, 2),
        Bucket: this.bucketName,
        Key: filename,
        ContentType: 'application/json; charset=utf-8'
      }).promise();
      console.log(`'${this.key(filename)} updated with ETag ${ETag}`);
      return this.url(filename);
    } catch(e) {
      throw new Error(`Failed to write '${this.key(this.filename)}':\n ${e}`);
    }
  }

  key(filename) {
    return `${this.bucketName}/${filename}`;
  }

  url(filename) {
    return `https://s3-${this.region}.amazonaws.com/${this.bucketName}/${filename}`;
  }

}

module.exports = S3Client;
