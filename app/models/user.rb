class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { client: 'client', chef: 'chef' }
  validates :role, presence: true, inclusion: { in: %w[client chef] }
  validates :name, presence: true

  def chef?
    role == 'chef'
  end

  def client?
    role == 'client'
  end

  has_many :menus, foreign_key: :user_id, dependent: :destroy
  has_many :bookings
  has_many :reviews
end
