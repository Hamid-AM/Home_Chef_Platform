class Chef < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destroy
  has_many :reviews

  validates :name, :specialties, :availability, :location, presence: true
end
