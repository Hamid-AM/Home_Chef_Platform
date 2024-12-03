class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :role, presence: true, inclusion: { in: %w[client chef] }

  has_one :chef, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews
end
