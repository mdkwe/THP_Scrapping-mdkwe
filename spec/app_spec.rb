require_relative '../lib/app'

url = 'https://coinmarketcap.com/all/views/all/'

describe "scrapping with Nogiri" do
  it "must loaded the page with data " do
    expect(open_page(url)).not_to be(nil)
  end

  it "must return an array with crypto currency name" do
    page = open_page(url)
    expect(scrapping_currencies(page).length).not_to be(0)
  end
end