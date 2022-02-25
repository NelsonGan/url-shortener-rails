require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  it 'can create a link' do
    # Mock a post request
    url = 'https://www.coingecko.com'
    post :create, params: { link: { target_url: url } }

    # Get the created link from the instance variable
    link = assigns(:link)

    # Validations on created link object
    expect(link.target_url).to eq(url)
    expect(link.valid?).to be(true)
    expect(link.slug.length).to be >= 5
    expect(link.slug.length).to be <= 15
  end
end