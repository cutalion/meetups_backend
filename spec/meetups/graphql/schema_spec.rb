require_relative '../../spec_helper'

describe Meetups::Graphql::Schema do
  let(:schema) { Meetups::Graphql::Schema }

  it 'creates talk' do
    meetup = MeetupRepository.new.create(date: '2018-06-01', start: '19:00', end: '21:00')
    speaker = SpeakerRepository.new.create(name: 'Alex')

    mutation = <<~M
      mutation {
        add_talk(
          meetup_id: "#{meetup.id}",
          title: "TITLE",
          description: "DESCRIPTION",
          presentation: "LINK",
          speaker_id: #{speaker.id}
        ) {
          id
          title
          description
          presentation
          meetup {
            id
          }
          speaker {
            id
          }
        }
      }
    M

    result = schema.execute(mutation).to_h

    result['data']['add_talk']['id'].wont_be_nil
    result['data']['add_talk']['meetup']['id'].must_equal meetup.id.to_s
    result['data']['add_talk']['speaker']['id'].must_equal speaker.id.to_s
    result['data']['add_talk']['title'].must_equal 'TITLE'
    result['data']['add_talk']['description'].must_equal 'DESCRIPTION'
    result['data']['add_talk']['presentation'].must_equal 'LINK'
  end

  it 'creates speaker' do
    mutation = <<~M
      mutation {
        add_speaker(
          name: "NAME",
        ) {
          id
          name
        }
      }
    M

    result = schema.execute(mutation).to_h

    result['data']['add_speaker']['name'].must_equal 'NAME'
  end
end
