# Currency

<p align="center">
    <img width="350" alt="architecture" src="https://github.com/Nomeyho/currency/raw/master/app/assets/architecture.png" />
</p>

## Mobile application
Flutter mobile application to convert currencies using up-to-date rates.

Link: [playstore](https://play.google.com/store/apps/details?id=currency.nomeyho.github.io.currency)

### Technical stack
* Flutter 1.5
* Dart

### Features
* Currency converter
* Auto-update of exchange rates
* Support more than 100 devises
* Available in EN and FR
* Works offline

### Screens

<p align="center">
    <img width="200" alt="screen 1" src="https://github.com/Nomeyho/currency/raw/master/app/assets/screen/mobile_1.png" />
    <img width="200" alt="screen 2" src="https://github.com/Nomeyho/currency/raw/master/app/assets/screen/mobile_2.png" />
    <img width="200" alt="screen 3" src="https://github.com/Nomeyho/currency/raw/master/app/assets/screen/mobile_3.png" />
    <img width="200" alt="screen 4" src="https://github.com/Nomeyho/currency/raw/master/app/assets/screen/mobile_4.png" />
</p>

## Backend
Save the daily currency rates in S3 and send an email notification using a serverless architecture.

### Technical stack
* AWS Lambda (NodeJS 8.10)
* AWS S3
* AWS SES
* [Fixer.io](https://fixer.io/)

## Roadmap
* Theming
* Add support for crypto-currencies
* Save historical data (e.g. `/year/month/day.json`)
