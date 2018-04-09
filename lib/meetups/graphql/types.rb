module Meetups
  MeetupType = GraphQL::ObjectType.define do
    name "Meetup"
    description "A meetup - event where people meet"
    # `!` marks a field as "non-null"
    field :id, !types.ID
    field :date, !types.String
    field :time, types[!MeetupTimeType]
    field :place, types[!MeetupPlaceType]
    field :description, !types.String
    field :talks, types[!TalkType]
    field :speakers, types[!SpeakerType]
    field :guests, types[!GuestType]
  end

  MeetupTimeType = GraphQL::ObjectType.define do
    name "MeetupTime"
    field :start, !types.String
    field :end, !types.String
  end

  MeetupPlaceType = GraphQL::ObjectType.define do
    name "MeetupPlace"
    field :address, !types.String
    field :city, types.String
  end

  GuestType = GraphQL::ObjectType.define do
    name "Guest"
    field :id, !types.ID
    field :name, !types.String
  end

  SpeakerType = GraphQL::ObjectType.define do
    name "Speaker"
    field :id, !types.ID
    field :name, !types.String
    field :avatar, types.String
    field :bio, types.String
    field :talks, types[!TalkType]
  end

  TalkType = GraphQL::ObjectType.define do
    name "Talk"
    field :id, !types.ID
    field :speaker, !SpeakerType
    field :title, !types.String
    field :description, types.String
    field :presentation, types.String
  end
end
