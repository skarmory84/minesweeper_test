class Minefield < ApplicationRecord
  has_many :mines

  enum status: %i[created playing paused lost]
  
  validates :x_size, presence: true, numericality: { greater_than: 0 }
  validates :y_size, presence: true, numericality: { greater_than: 0 }

  before_create do
    self.uuid = SecureRandom.uuid
    self.status = 0
  end
end