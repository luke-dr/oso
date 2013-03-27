desc "Fetch flight list"

  task :fetch_flight_list => :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'sanitize'

      url = "http://flightaware.com/live/findflight/dfw/KLAX/"
      doc = Nokogiri::HTML(open(url))
      puts url
#      puts doc
#      puts doc.css('#ffinder-results')
      puts doc.css('table#Results').to_s
 #     puts doc
#      doc = Nokogiri::HTML(open(url))
#      puts Sanitize.clean(doc.css('.statusBlock .statusType').to_s).strip

  end
