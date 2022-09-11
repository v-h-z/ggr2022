require 'open-uri'
require "nokogiri"

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
    positions_serialized = URI.open(url).read
    p positions_xml = Nokogiri::XML(positions_serialized)
  end
end
