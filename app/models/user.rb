class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :role, inclusion: { in: %w[client chef] }

  has_one :chef, dependent: :destroy
  has_many :boockings, dependent: :destroy
end
