class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  belongs_to :menu

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true, length: { minimum: 10 }
  validates :user_id, uniqueness: { scope: :booking_id, message: 'You have already reviewed this booking' }
end
