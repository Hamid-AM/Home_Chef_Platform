class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  validates :date, :time, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending confirmed cancelled] }
end
