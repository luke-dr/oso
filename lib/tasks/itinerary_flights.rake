desc "Fetch flight list"

  task :fetch_flight_list => :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'sanitize'

      url = "http://www.flightstats.com/go/FlightSchedules/schedules.do?departure=dfw&arrival=lax&depDate=2013-3-26&tripType=1"
      doc = Nokogiri::HTML(open(url))
      puts url
#      puts doc.css('.sfArr , .sfDep, .scheduledAirlineLogo')
#      puts doc.
#      doc = Nokogiri::HTML(open(url))
#      puts Sanitize.clean(doc.css('.statusBlock .statusType').to_s).strip

  end
