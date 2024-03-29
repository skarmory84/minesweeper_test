class Square < ApplicationRecord
  belongs_to :minefield

  enum visibility_status: %i[hidden shown question_mark red_flag]
  enum asociated_item: %i[empty_space mine]

  validates :x_position, presence: true 
  validates :y_position, presence: true 

  before_create do
    self.visibility_status = "hidden"
    self.asociated_item = "empty_space"
  end

  def flip!
    return false if ["shown", "question_mark", "red_flag"].include? self.visibility_status
    self.visibility_status = "shown"
    self.save
  end

  def mark(mark_type)
    return false if self.visibility_status != "hidden"
    self.visibility_status = mark_type
    self.save
  end

  def empty_adjacent_squares
    #TODO
    [self]
  end
end