class LockerBox < ApplicationRecord
  # validations
  validates :name, :identification, presence: true

  # Relationships
  has_many :parcels
end
