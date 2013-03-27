class ItinerariesController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  before_filter :find_itinerary, :only => [:show, :edit, :update, :destroy]
  before_filter :find_current_user, :except => :index

  def index
    if current_user
      @user = current_user
      @itineraries = @user.itineraries
    else
      @user = User.new
    end
  end

  def new
    @itinerary = Itinerary.new
    @flight = @itinerary.flights.new
  end

  def create
    @itinerary = Itinerary.new(params[:itinerary])
    if @itinerary.save
      flash[:notice] = "Itinerary has been created."
      redirect_to @itinerary
    else
      @flight = Flight.new(params[:flight])
      flash[:alert] = "Itinerary has not been created."
      render :action => "new"
    end
  end

  def show
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'sanitize'

    @itinerary.flights.each do |f|
      if !f.flight_number.blank? && !f.scheduled_departure_time.blank? && !f.airline_code.blank? && (f.scheduled_departure_time.to_date - Date.today.to_date).to_i < 3
        url = "http://www.flightstats.com/go/FlightStatus/flightStatusByFlight.do?airline=#{f.airline_code.downcase}&flightNumber=#{f.flight_number}&departureDate=#{f.scheduled_departure_time.to_date}&x=0&y=0"
        doc = Nokogiri::HTML(open(url))
        f.update_attribute(:status, Sanitize.clean(doc.css('.statusBlock .statusType').to_s).strip)
      else
        f.update_attribute(:status, "Available within 2 hours of flight.")
      end
      if (!f.status.to_s.downcase.include? "on-time") || (!f.status.to_s.downcase.include? "schduled")
      url = "http://flightaware.com/live/findflight/#{f.departure_airport}/#{f.arrival_airport}/"
      doc = Nokogiri::HTML(open(url))
      @alt_flights = doc.css('table#Results').to_s
      end

    end
  end

  def edit

  end

  def update
    if @itinerary.update_attributes(params[:itinerary])
      flash[:notice] = "Itinerary has been updated."
      redirect_to @itinerary
    else
      flash[:alert] = "Itinerary has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @itinerary.destroy
    flash[:notice] = "Itinerary has been deleted."
    redirect_to itineraries_path
  end

  private
    def find_itinerary
      @itinerary = Itinerary.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The itinerary you are looking for could not be found."
      redirect_to itineraries_path
    end
end
