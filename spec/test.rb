require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sanitize'


# Get a Nokogiri::HTML::Document for the page we’re interested in...

#url = "http://www.flightstats.com/go/FlightStatus/flightStatusByFlight.do?airline=aa&flightNumber=5&departureDate=2013-03-25&x=0&y=0"
url = "https://www.google.com/flights/#search;f=SEA,BFI;t=DFW,DAL;d=2013-04-10;r=2013-04-14"
doc = Nokogiri::HTML(open(url))

# Do funky things with it using Nokogiri::XML::Node methods...

####
# Search for nodes by css
doc.css('script').each do |script|
  puts script.content
end

#puts Sanitize.clean(doc.to_s).strip
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
