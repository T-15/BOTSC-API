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