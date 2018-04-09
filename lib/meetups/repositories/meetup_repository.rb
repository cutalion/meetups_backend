class MeetupRepository < Hanami::Repository
  associations do
    has_many :talks
    has_many :speakers, through: :talks
  end
end
