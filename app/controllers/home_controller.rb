class HomeController < ApplicationController
  add_flash_types :success, :error, :slug

  def index
    @link = Link.new
  end
end
