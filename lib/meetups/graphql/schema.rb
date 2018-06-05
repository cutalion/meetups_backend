module Meetups
  module Graphql
    Schema = GraphQL::Schema.define do
      query ::Meetups::Graphql::Query
      mutation ::Meetups::Graphql::Mutation
    end
  end
end
