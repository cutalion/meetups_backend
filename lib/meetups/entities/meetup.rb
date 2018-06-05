class Meetup < Hanami::Entity
  def time
    "#{self.start}-#{self.end}"
  end
end
