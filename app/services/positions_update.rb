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
    positions_xml = Nokogiri::XML(positions_serialized)
    positions_xml.root.xpath("//Group/*").each do |data|
      p data.attribute('name').text
      p data.attribute('serial').text
      p data.attribute('marker').text
      data.children.each do |child|
        child.children.each do |grand_child|
          p grand_child.name.strip
          p grand_child.text.strip
        end
      end
      break
      # first_name = beatle.xpath("first_name").text
      # last_name = beatle.xpath("last_name").text
      # instrument = beatle.xpath("instrument").text
    end
  end
end
