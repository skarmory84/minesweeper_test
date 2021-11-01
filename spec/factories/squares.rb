FactoryBot.define do
    factory :square do
      x_position { 0 }
      y_position { 0 }
      asociated_item { "empty_space" }
      minefield { create(:minefield) }
    end
  end
  