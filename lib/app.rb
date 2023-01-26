# TO DO : retrieve the price of all crypto-currencies and store them neatly in an array of hashes.
# Home Made By : Michelle D.K.

require 'nokogiri'
require 'open-uri'
require 'pry'


def open_page(url_html)
  # Fetch and parse HTML document
  return Nokogiri::HTML(URI.open(url_html))
end

def fusiontab(tab1,tab2)
  return Hash[tab1.zip(tab2)]
end

def scrapping_currencies(page)
  # Search for nodes by xpath
  
  currencies_name = []
  currencies_value = []
  hash={}

  page.xpath("//*[contains(@class,'cmc-table__column-name--name cmc-link')]").each do |name|
    currencies_name.append(name.content)
  end

  page.xpath('//tr//td[5]/div/a/span').each do |value|
    currencies_value.append(value.content)
  end

  hash=fusiontab(currencies_name,currencies_value)
  return hash

end 

def perform()
  url = 'https://coinmarketcap.com/all/views/all/'
  page = open_page(url)
  currency_array = scrapping_currencies(page)
  puts "Number of element : #{currency_array.size()}"
  print currency_array
end

perform