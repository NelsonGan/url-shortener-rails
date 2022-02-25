require 'nokogiri'
require 'open-uri'

class LinksController < ApplicationController
  def show
    @link = Link.find(params[:id])

    begin
      @title = Nokogiri::HTML.parse(URI.open(@link.target_url)).title
    rescue
      @title = "N/A"
    end
  end

  def create
    shortener = Shortener.new(link_params[:target_url])
    @link = shortener.create_link

    if @link.new_record?
      redirect_to root_path, :flash => {
        :error => 'Invalid link, please try again!'
      }
    else
      redirect_to link_path(@link.id), :flash => {
        :success => 'Successfully created your short link!',
      }
    end
  end

  def shorten
    @link = Link.find_by(slug: params[:slug])

    # TODO: Perform record tracking
    @link.clicks += 1
    @link.save

    if Rails.env.production?
      location = "#{request.location.city}, #{request.location.country}"
    else
      location = "Kuala Lumpur, SG"
    end

    VisitHistory.create(
      link: @link,
      geolocation: location
    )

    redirect_to @link.target_url, allow_other_host: true
  end

  private
  def link_params
    params.require(:link).permit(:target_url)
  end
end