require 'nokogiri'
require 'open-uri'

# Some ideas:
# Read in list of <city,state> from the command line
# Top 3 Google news headlines
# Population
# Art/Culture
# Weather trends


doc = Nokogiri::HTML(URI.open("https://en.wikipedia.org/wiki/Bellevue%2C_Washington"))

doc.css('table').each do |table|
  header = table.at_css('th')
  if header != nil and header.content.include?('Climate data')
    table.css('tr').each do |row|
      row_header = row.at_css('th')
      print row_header.content.chomp + ': ' unless row_header == nil
      row.css('td').each do |data|
        print data.content.chomp + " "
      end
      puts
    end
  end
end
