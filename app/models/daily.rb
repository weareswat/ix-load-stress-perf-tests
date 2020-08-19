class Daily < Schedule
  def self.advance(date, interval)
    date.advance(:days => interval)
  end
end