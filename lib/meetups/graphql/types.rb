module Meetups
  module Graphql
    module Types
      Meetup = GraphQL::ObjectType.define do
        name "Meetup"
        description "A meetup - event where people meet"
        # `!` marks a field as "non-null"
        field :id, !types.ID
        field :date, !types.String
        field :time, !types.String
        field :place, types[!MeetupPlace]
        field :description, !types.String
        field :talks, types[!Talk]
        field :speakers, types[!Speaker]
        field :guests, types[!Guest]
      end

      MeetupPlace = GraphQL::ObjectType.define do
        name "MeetupPlace"
        field :address, !types.String
        field :city, types.String
      end

      Talk = GraphQL::ObjectType.define do
        name "Talk"
        field :id, !types.ID
        field :speaker, !Speaker
        field :meetup, !Meetup
        field :title, !types.String
        field :description, types.String
        field :presentation, types.String
      end

      Speaker = GraphQL::ObjectType.define do
        name "Speaker"
        field :id, !types.ID
        field :name, !types.String
        field :avatar, types.String
        field :bio, types.String
        field :talks, types[!Talk]
      end

      Guest = GraphQL::ObjectType.define do
        name "Guest"
        field :id, !types.ID
        field :name, !types.String
      end
    end
  end
end
