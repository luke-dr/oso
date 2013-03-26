desc "Fetch flight status"

  task :fetch_flight_status => :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'sanitize'

    Flight.all.each do |f|
      # Get a Nokogiri::HTML::Document for the page we’re interested in...
      if !f.flight_number.blank? && !f.scheduled_departure_time.blank? && !f.airline_code.blank? && (f.scheduled_departure_time.to_date - Date.today.to_date).to_i < 3
      url = "http://www.flightstats.com/go/FlightStatus/flightStatusByFlight.do?airline=#{f.airline_code.downcase}&flightNumber=#{f.flight_number}&departureDate=#{f.scheduled_departure_time.to_date}&x=0&y=0"
      doc = Nokogiri::HTML(open(url))
      puts Sanitize.clean(doc.css('.statusBlock .statusType').to_s).strip
    end

#    doc = Nokogiri::HTML(open(url))
#    status = Sanitize.clean(doc.css('.statusBlock .statusType').to_s).strip
#    itinerary.update_atttribute(:status, status)
  end

end
