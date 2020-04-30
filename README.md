[![Maintainability](https://api.codeclimate.com/v1/badges/220fc319466b738061dd/maintainability)](https://codeclimate.com/github/T-15/BOTSC-APImaintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/220fc319466b738061dd/test_coverage)](https://codeclimate.com/github/T-15/BOTSC-API/test_coverage) [![Build Status](https://travis-ci.com/T-15/BOTSC-API.svg?branch=master)](https://travis-ci.com/T-15/BOTSC-API)

# Docker

Make sure you have docker installed, then build the app:
`docker-compose up  --build`

Create the dev and test databases in the new environment:
`docker-compose run web rails db:create`

Migrate the database:
`docker-compose run web rails db:migrate`

Seed the database:
`docker-compose run web rails db:seed RAILS_ENV=development`

Remember to shut down with:
`docker-compose down`