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
      name = data.attribute('name').text
      serial = data.attribute('serial').text
      marker = data.attribute('marker').text
      boat = Boat.where(
        race: @race,
        name: name,
        yb_serial: serial,
        yb_marker: marker
        ).first_or_create
      data.children.each_with_index do |child, i|
        next if i == 0
        position_data = {boat: boat}
        child.children.each_with_index do |grand_child, index|
          if index.odd?
            unless grand_child.name.strip.underscore == 'id'
              position_data[grand_child.name.strip.underscore] = grand_child.text.strip
            else
              position_data['yb_id'] = grand_child.text.strip
            end
          end
        end
        Position.where(position_data).first_or_create
      end
      # first_name = beatle.xpath("first_name").text
      # last_name = beatle.xpath("last_name").text
      # instrument = beatle.xpath("instrument").text
    end
  end
end
