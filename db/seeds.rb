User.create!(name: "user1", email: "user1@example.com", password: "111111", password_confirmation: "111111", admin: false)
User.create!(name: "user2", email: "user2@example.com", password: "111111", password_confirmation: "111111", admin: false)
User.create!(name: "user3", email: "user3@example.com", password: "111111", password_confirmation: "111111", admin: false)
User.create!(name: "user4", email: "user4@example.com", password: "111111", password_confirmation: "111111", admin: false)
User.create!(name: "user5", email: "user5@example.com", password: "111111", password_confirmation: "111111", admin: false)
User.create!(name: "admin_user", email: "admin@example.com", password: "111111", password_confirmation: "111111", admin: true)

Group.create!(name: "group1", owner_id: 1)
Group.create!(name: "group2", owner_id: 2)
Group.create!(name: "group3", owner_id: 3)
Group.create!(name: "group4", owner_id: 4)
Group.create!(name: "group5", owner_id: 5)

GroupUser.create!(user_id: 1, group_id: 1)
GroupUser.create!(user_id: 2, group_id: 2)
GroupUser.create!(user_id: 3, group_id: 3)
GroupUser.create!(user_id: 4, group_id: 4)
GroupUser.create!(user_id: 5, group_id: 5)

5.times do |i|
  Label.create!(name: "label#{i+1}")
end

5.times do |i|
  FoodPrep.create!(name: "仕込み#{i+1}", ingredient: "食材#{i+1}", group_id: 1)
end

5.times do |i|
  SelectFoodPrep.create!(food_prep_id: 1, group_id: 1, user_id: 1, to_do_at: "2022-12-18")
end

5.times do |i|
  SelectFoodPrep.create!(food_prep_id: 2, group_id: 1, user_id: 1, to_do_at: "2022-12-17")
end

3.times do |i|
  SelectFoodPrep.create!(food_prep_id: 3, group_id: 1, user_id: 1, to_do_at: "2022-12-25")
end

3.times do |i|
  SelectFoodPrep.create!(food_prep_id: 4, group_id: 1, user_id: 1, to_do_at: "2022-12-05")
end

3.times do |i|
  SelectFoodPrep.create!(food_prep_id: 4, group_id: 1, user_id: 1, to_do_at: "2022-12-01")
end

3.times do |i|
  SelectFoodPrep.create!(food_prep_id: 5, group_id: 1, user_id: 1, to_do_at: "2022-12-27")
end

