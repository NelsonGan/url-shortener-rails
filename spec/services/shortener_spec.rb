require 'rails_helper'

RSpec.describe Shortener do
  it "shortens an URL to a min 5 and max 15 characters slug" do
    url = "https://www.coingecko.com"
    shortener = Shortener.new(url)
    expect(shortener.slug.length).to be >= 5
    expect(shortener.slug.length).to be <= 15
  end

  it "gives each URL a unique slug" do
    url = "https://www.coingecko.com"
    shortener = Shortener.new(url)
    slug1 = shortener.slug

    url = "https://www.coingecko.com"
    shortener = Shortener.new(url)
    slug2 = shortener.slug

    expect(slug1).not_to eq(slug2)
  end

  it "generate a Link record with a unique slug" do
    url = "https://www.coingecko.com"
    shortener = Shortener.new(url)
    link = shortener.create_link
    expect(link.valid?).to be(true)

    link2 = shortener.create_link
    expect(link2.valid?).to be(true)
  end
end