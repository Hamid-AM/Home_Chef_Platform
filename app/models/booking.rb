class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_many :reviews

  validates :date, :time, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending confirmed cancelled] }
  validates :notes, length: { maximum: 500 }
end
