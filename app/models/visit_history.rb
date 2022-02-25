class VisitHistory < ApplicationRecord
  belongs_to :link

  validates :geolocation, presence: true
end
