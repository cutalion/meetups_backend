class TalkRepository < Hanami::Repository
  associations do
    belongs_to :meetup
    belongs_to :speaker
  end
end
