class TalkRepository < Hanami::Repository
  associations do
    belongs_to :meetup
    belongs_to :speaker
  end

  def find_with_assocs(id)
    aggregate(:speaker, :meetup).where(id: id).one
  end
end
