class AirlinesController < ApplicationController

  def index
  end

  def new
    @airline = Airline.new
  end

end
