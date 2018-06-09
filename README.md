This is a pet project of mine (@cutalion).
Here I'm learning how to build and deploy ruby application with docker.
I also learning hanami framework and graphql.

There is also a frontend part of it, single page application on react
with server-side rendering.
https://github.com/cutalion/meetups_frontend

## Installation

### Easy way

Just run `docker-compose up -d` (assuming you've installed docker and docker-compose).
Prepare databse with `docker-compose run backend bundle exec hanami db prepare`.

### Traditional way

`bundle install`
`bundle exec hanami db prepare`
`bundle exec hanami s`

You may want to edit `.env.development` to set the `DATABASE_URL` (postgres).

## GraphiQL

Open http://localhost:2300/graphiql

## Frontend

See https://github.com/cutalion/meetups_frontend#installation
