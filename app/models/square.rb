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
end