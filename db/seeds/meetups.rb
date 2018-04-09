require_relative '../../config/boot'

meetups = MeetupRepository.new
talks = TalkRepository.new
speakers = SpeakerRepository.new

m = meetups.create(date: Date.today + 30, start: '19:00', end: '21:00')
s = speakers.create(name: 'Alex', bio: 'Good guy')
talks.create(meetup_id: m.id, speaker_id: s.id, title: 'Hanami + GraphQL')
