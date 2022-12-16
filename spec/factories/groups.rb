FactoryBot.define do
  factory :group do
    name { "group1"}
    owner_id { FactoryBot.create(:first_user)}
  end
end
