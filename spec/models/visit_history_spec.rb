require 'rails_helper'

RSpec.describe VisitHistory, type: :model do
  it "is valid if geolocation and link is present" do
    link = Link.new(
      target_url: "https://www.coingecko.com",
      slug: "1234567"
    )

    visit_history = VisitHistory.new(
      link: link,
      geolocation: "Kuala Lumpur",
    )

    expect(visit_history.valid?).to be(true)
  end

  it "is invalid if geolocation is not present" do
    link = Link.new(
      target_url: "https://www.coingecko.com",
      slug: "1234567"
    )

    visit_history = VisitHistory.new(
      link: link,
    )

    expect(visit_history.valid?).to be(false)
  end

  it "is invalid if link is not present" do
    visit_history = VisitHistory.new(
      geolocation: "Kuala Lumpur",
    )

    expect(visit_history.valid?).to be(false)
  end
end
