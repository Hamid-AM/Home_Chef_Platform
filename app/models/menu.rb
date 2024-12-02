class Menu < ApplicationRecord
  belongs_to :chef

  validates :title, :description, :price, presence: true
end
