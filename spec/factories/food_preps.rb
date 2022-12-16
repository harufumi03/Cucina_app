FactoryBot.define do
  factory :food_prep do
    name { "トマトソース"}
    ingredient { "トマト"}
    group_id { FactoryBot.create(:group)}
  end
end
