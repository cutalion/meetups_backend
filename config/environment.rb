require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/meetups'
require_relative '../apps/graphiql/application'
require_relative '../apps/api/application'

Hanami.configure do
  mount Graphiql::Application, at: '/graphiql'
  mount Api::Application, at: '/api/v1'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/meetups_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/meetups_development'
    #    adapter :sql, 'mysql://localhost/meetups_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/meetups/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV['SMTP_HOST'], port: ENV['SMTP_PORT']
    end
  end
end
