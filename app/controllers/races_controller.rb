class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params['id'])
    @boats = @race.boats.select{!_1.positions.empty?}
    PositionsUpdate.new(@race).call
    @markers = @boats.map do |boat|
      position = boat.positions.last
      {
        lat: position.latitude,
        lng: position.longitude,
        info_window: render_to_string(partial: "info_window", locals: {boat: boat})
      }
    end
  end
end
