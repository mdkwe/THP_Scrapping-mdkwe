require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
page = Nokogiri::HTML(URI.open('https://nokogiri.org/tutorials/installing_nokogiri.html'))

# Search for nodes by xpath
page.xpath('//nav//ul//li/a', '//article//h2').each do |link|
  puts link.content
end