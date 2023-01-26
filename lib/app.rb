# TO DO : retrieve the price of all crypto-currencies and store them neatly in an array of hashes.
# Home Made By : Michelle D.K.

require 'nokogiri'
require 'open-uri'
require 'pry'


def open_page(url_html)
  # Fetch and parse HTML document
  return Nokogiri::HTML(URI.open(url_html))
end

def scrapping_currencies(page)
  # Search for nodes by xpath
  
  currencies_name = []

  page.xpath("//*[contains(@class,'cmc-table__column-name--name cmc-link')]").each do |currency|
    currencies_name.append(currency.content)
  end

  return currencies_name
end 

def perform()
  url = 'https://coinmarketcap.com/all/views/all/'
  page = open_page(url)
  currency_array = scrapping_currencies(page)
  puts "Number of element : #{currency_array.size()}"
  print currency_array

end

perform
