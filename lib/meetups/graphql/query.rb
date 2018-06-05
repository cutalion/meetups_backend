require_relative './types'

module Meetups
  module Graphql
    Query = GraphQL::ObjectType.define do
      name "Query"
      description "The query root of this schema"

      field :meetup do
        type ::Meetups::Graphql::Types::Meetup
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
        type types[Types::Meetup]
        description "All meetups"
        resolve ->(obj, args, ctx) {
          MeetupRepository.new
            .aggregate(:speakers, talks: :speaker)
            .to_a
        }
      end
    end
  end
end
