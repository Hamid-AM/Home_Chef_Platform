class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true, length: { minimum: 10 }
end
