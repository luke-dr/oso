require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sanitize'


# Get a Nokogiri::HTML::Document for the page we’re interested in...

url = "http://www.flightstats.com/go/FlightStatus/flightStatusByFlight.do?airline=aa&flightNumber=5&departureDate=2013-03-25&x=0&y=0"
doc = Nokogiri::HTML(open(url))

# Do funky things with it using Nokogiri::XML::Node methods...

####
# Search for nodes by css
puts Sanitize.clean(doc.css('.statusBlock .statusType').to_s).strip
####
# Search for nodes by xpath
#doc.xpath('//h3/a').each do |link|
#puts link.content
#end

####
# Or mix and match.
#doc.search('h3.r a.l', '//h3/a').each do |link|
#puts link.content
#end
