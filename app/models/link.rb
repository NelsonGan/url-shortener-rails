class Link < ApplicationRecord
  has_many :visit_histories

  validates :slug, presence: true, uniqueness: true
  validates :target_url, presence: true, url:true

  def generate_short_link
    "https://#{Rails.application.secrets.host}/s/#{slug}"
  end
end
