class Link < ApplicationRecord
  has_many :visit_histories

  validates :slug, presence: true, uniqueness: true
  validates :target_url, presence: true, url:true

  def generate_short_link
    "https://localhost:3000/s/#{slug}"
  end
end
