# Docker

Make sure you have docker installed, then build the app:
`docker-compose build`

Create the dev and test databases in the new environment:
`docker-compose run web rails db:create`

Migrate the database:
`docker-compose run web rails db:migrate`

Start the container:
`docker-compose up`

Remember to shut down with:
`docker-compose down`