class FlightsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_itinerary, :only => [:new, :show, :create, :edit, :update, :destroy]
  before_filter :find_current_user
  before_filter :find_flight, :only => [:show, :destroy, :update, :edit]

  def new
    @flight = @itinerary.flights.build(params[:flight])
  end

  def create
    @flight = @itinerary.flights.build(params[:flight])
    if @flight.save
      flash[:notice] = "Flight has been created."
      redirect_to @itinerary
    else
      flash[:alert] = "Flight has not been created."
      render :action => "new"
    end
  end

  def show
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'sanitize'

      if !@flight.flight_number.blank? && !@flight.scheduled_departure_time.blank? && !@flight.airline_code.blank? && (@flight.scheduled_departure_time.to_date - Date.today.to_date).to_i < 3
        url = "http://www.flightstats.com/go/FlightStatus/flightStatusByFlight.do?airline=#{@flight.airline_code.downcase}&flightNumber=#{@flight.flight_number}&departureDate=#{@flight.scheduled_departure_time.to_date}&x=0&y=0"
        doc = Nokogiri::HTML(open(url))
        @flight.update_attribute(:status, Sanitize.clean(doc.css('.statusBlock .statusType').to_s).strip)
      else
        @flight.update_attribute(:status, "Available within 2 hours of flight.")
      end

      if !(@flight.status.to_s.downcase.include? "on-time") && !(@flight.status.to_s.downcase.include? "scheduled")
        url = "http://flightaware.com/live/findflight/#{@flight.departure_airport}/#{@flight.arrival_airport}/"
        doc = Nokogiri::HTML(open(url))

        @alt_flights = doc.css('table#Results').to_s
      end
    end

  def edit
  end

  def update
    if @flight.update_attributes(params[:flight])
      flash[:notice] = "Flight has been updated."
      redirect_to @itinerary
    else
      flash[:alert] = "Flight has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @flight.destroy
    flash[:notice] = "Flight has been deleted."
    redirect_to @itinerary
  end

  private

    def find_itinerary
      @itinerary = Itinerary.find(params[:itinerary_id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The itinerary you are looking for could not be found."
      redirect_to itineraries_path
    end

    def find_flight
      @flight = Flight.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The flight you are looking for could not be found."
      redirect_to @itinerary
    end
end
