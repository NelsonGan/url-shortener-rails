require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UrlShortenerRails
  class Application < Rails::Application
    config.load_defaults 7.0
    config.exceptions_app = self.routes
    config.time_zone = "Asia/Singapore"
    config.active_record.default_timezone = :local
  end
end
