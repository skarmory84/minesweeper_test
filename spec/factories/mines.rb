FactoryBot.define do
    factory :mine do
      x_position { 0 }
      y_position { 0 }
      visibility_status { 0 }
      asociated_item { 0 }
      minefield { create(:minefield) }
    end
  end
  