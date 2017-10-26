class Recipient < ApplicationRecord
  validates :full_name, :identification, presence: true
end
