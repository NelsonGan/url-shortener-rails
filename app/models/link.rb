class Link < ApplicationRecord
  has_many :visit_histories

  before_validation :remove_url_protocol
  after_validation :add_url_protocol

  validates :slug, presence: true, uniqueness: true
  validates :target_url, presence: true, url:true

  def generate_short_link
    if Rails.env.production?
      "https://#{Rails.application.secrets.host}/s/#{slug}"
    else
      "http://#{Rails.application.secrets.host}/s/#{slug}"
    end
  end

  private

  def add_url_protocol
    unless target_url[/\Ahttp:\/\//] || target_url[/\Ahttps:\/\//]
      self.target_url = "https://#{target_url}"
    end
  end

  def remove_url_protocol
    if target_url[/\Ahttp:\/\//] || target_url[/\Ahttps:\/\//]
      uri = URI(target_url)
      self.target_url = uri.hostname + uri.path
    end
  end
end
