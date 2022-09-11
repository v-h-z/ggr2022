require 'open-uri'

class PositionsUpdate
  def initialize(race)
    @race = race
  end

  def call
    fetch_xml
  end

  private

  def fetch_xml
    url = "https://cf.yb.tl/xml/#{@race.code}"
    p positions_serialized = URI.open(url).read
  end
end
