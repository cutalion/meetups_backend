FROM ruby:2.5.1

RUN apt-get update \
    && apt-get install -yq postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# for deployment
# RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
