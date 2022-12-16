FactoryBot.define do
  factory :group do
    name { "group1"}
    owner { FactoryBot.create(:first_user)}
  end
end
