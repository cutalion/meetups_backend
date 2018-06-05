require_relative './types'

module Meetups
  module Graphql
    Mutation = GraphQL::ObjectType.define do
      name "Mutation"
      description "The mutation root of this schema"

      field :create_meetup do
        type ::Meetups::Graphql::Types::Meetup
        argument :date, !types.String
        argument :start_time, !types.String
        argument :end_time, !types.String
        argument :description, !types.String

        description "Create meetup"

        resolve ->(obj, args, ctx) {
          puts args.inspect
          MeetupRepository.new.create(
            date: Date.parse(args[:date]),
            start: args[:start_time],
            end: args[:end_time],
            description: args[:description]
          )
        }
      end

      field :add_talk do
        type ::Meetups::Graphql::Types::Talk
        argument :meetup_id, !types.ID
        argument :speaker_id, !types.ID
        argument :title, !types.String
        argument :description, types.String
        argument :presentation, types.String

        description "Add talk to meetup"

        resolve ->(obj, args, ctx) {
          repo = TalkRepository.new
          talk = repo.create(args.to_h.transform_keys(&:to_sym))
          repo.find_with_assocs(talk.id)
        }
      end

      field :add_speaker do
        type ::Meetups::Graphql::Types::Speaker
        argument :name, !types.String
        argument :avatar, types.String
        argument :bio, types.String

        description "Add new speaker"

        resolve ->(obj, args, ctx) {
          SpeakerRepository.new.create(args.to_h.transform_keys(&:to_sym))
        }
      end
    end
  end
end
