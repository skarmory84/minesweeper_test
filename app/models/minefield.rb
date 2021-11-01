class Minefield < ApplicationRecord
  has_many :mines

  enum status: %i[created playing paused lost]
  
  validates :x_size, presence: true, numericality: { greater_than: 0 }
  validates :y_size, presence: true, numericality: { greater_than: 0 }
  validates :mines_number, numericality: { greater_than: 0 }
  validate :mines_quantity

  before_create do
    self.uuid = SecureRandom.uuid
    self.status = 0
  end

  after_create do 
    #create squares
    for x in 0..x_size-1
      for y in 0..y_size-1
        Mine.create(
          minefield: self,
          x_position: x,
          y_position: y
        )
      end
    end

    #fill some squares with mines
    mines_positions_array = Array.new
    while mines_positions_array.size < self.mines_number
      x_rand = rand(x_size)
      y_rand = rand(y_size)
      rand_position_array = [x_rand, y_rand]
      mines_positions_array.push(rand_position_array) unless mines_positions_array.include?(rand_position_array)
    end

    mines_positions_array.each do |position|
      self.mines.find_by(x_position: position[0], y_position: position[1])
        .update(asociated_item: "mine")
    end
  end

  def mines_quantity
    if mines_number.nil?
      return errors.add(:mines_number, "can't be nil")
    end
    if mines_number >= x_size * y_size
      errors.add(:mines_number, "can't be greater than the number of squares")
    end
  end
end