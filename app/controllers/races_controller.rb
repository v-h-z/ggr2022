class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params['id'])
    PositionsUpdate.new(@race).call
    @markers = @race.boats.map do |boat|
      position = boat.positions.last
      if position
        {
          lat: position.latitude,
          lng: position.longitude,
          info_window: render_to_string(partial: "info_window", locals: {boat: boat})
        }
      end
    end
  end
end
