class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { client: 'client', chef: 'chef' }
  validates :role, presence: true, inclusion: { in: %w[client chef] }
  validates :name, presence: true

  has_many :menus, foreign_key: :user_id, dependent: :destroy
  has_many :bookings
  has_many :reviews

  # Pour geocoder / map
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
