# Currency

## Currency backend
Save the daily currency rates in S3 and notify by email using a serverless architecture.

### Technical stack
* AWS Lambda (NodeJS 8.10)
* AWS S3
* AWS SES
* [Fixer.io](https://fixer.io/)

### Deploy
From `backend` folder, run:
1. Install dependencies
```
npm install
```
2. Create an `.env` file with the following content (the email must be verified by AWS):
```
FIXER_API_KEY=**********
EMAIL=**********@****.***
```

3. Deploy to dev/production
```
npm run deploy-prod
// or
npm run deploy-dev
```

## Mobile application
Flutter mobile application to convert correncies using up-to-date rates.

## Roadmap
* Theming
* Favorite & recently used currencies
* Add support for crypto-currencies
* Save historical data (e.g. `/year/month/day.json`)

## Resources
https://gist.github.com/Fluidbyte/2973986
