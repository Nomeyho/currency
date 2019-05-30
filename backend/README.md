# Backend

## Deploy
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
