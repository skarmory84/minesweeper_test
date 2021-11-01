FactoryBot.define do
    factory :mine do
      x_position { 0 }
      y_position { 0 }
      asociated_item { "empty_space" }
      minefield { create(:minefield) }
    end
  end
  