class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_many :reviews
end
