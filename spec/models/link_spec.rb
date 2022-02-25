require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is valid if slug and target url is present" do
    link = Link.new(
      target_url: "https://www.coingecko.com",
      slug: "1234567"
    )

    expect(link.valid?).to be(true)
  end

  it "is invalid if slug is not present" do
    link = Link.new(
      target_url: "https://www.coingecko.com"
    )

    expect(link.valid?).to be(false)
  end

  it "is invalid if target url is not present" do
    link = Link.new(
      slug: "1234567"
    )

    expect(link.valid?).to be(false)
  end

  it "is invalid if slug is not unique" do
    link = Link.new(
      target_url: "https://www.coingecko.com",
      slug: "1234567"
    )
    link.save

    link2 = Link.new(
      target_url: "https://www.coingecko.com",
      slug: "1234567"
    )

    expect(link2.valid?).to be(false)
  end

  it "is invalid if url is not formatted" do
    link = Link.new(
      target_url: "coingecko",
      slug: "1234567"
    )

    expect(link.valid?).to be(false)
  end
end