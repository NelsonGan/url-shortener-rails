class ErrorsController < ApplicationController
  def not_found
    render status: 404, layout:'error'
  end

  def internal_server_error
    render status: 500, layout:'error'
  end
end
