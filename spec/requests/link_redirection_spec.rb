require 'rails_helper'

RSpec.describe 'Link redirection', type: :request do
  it 'redirects to the target URL for a given short link' do
    url = 'https://www.coingecko.com'
    shortener = Shortener.new(url, Link)
    link = shortener.create_link

    get link.generate_short_link
    expect(response).to redirect_to(link.target_url)
  end
end