require_relative './types'

module Meetups
  QueryType = GraphQL::ObjectType.define do
    name "Query"
    description "The query root of this schema"

    field :meetup do
      type Meetups::MeetupType
      argument :id, !types.ID
      description "Find a Meetup by ID"
      resolve ->(obj, args, ctx) {
        MeetupRepository.new
          .aggregate(:speakers, talks: :speaker)
          .where(id: args['id'])
          .one
      }
    end

    field :meetups do
      type types[Meetups::MeetupType]
      description "All meetups"
      resolve ->(obj, args, ctx) {
        MeetupRepository.new
          .aggregate(:speakers, talks: :speaker)
          .to_a
      }
    end
  end

  Schema = GraphQL::Schema.define do
    query QueryType
  end
end
