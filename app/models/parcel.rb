class Parcel < ApplicationRecord
  belongs_to :locker_box
  belongs_to :recipient
end
