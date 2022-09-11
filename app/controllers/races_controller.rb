class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params['id'])
    PositionsUpdate.new(@race).call
  end
end
