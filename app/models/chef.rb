class Chef < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destroy

  validates :name, :specialties, :availability, :location, presence: true
end
