FactoryBot.define do
  factory :first_user, class: User do
    name { "user1" }
    email { "user1@sample.com" }
    password { "111111" }
    # password_digest { "111111" }
    admin { false }
  end

  factory :second_user, class: User do
    name { "user2" }
    email { "user2@sample.com" }
    password { "222222" }
    # password_digest { "222222" }
    admin { false }
  end

  factory :third_user, class: User do
    name { "user3" }
    email { "user3@sample.com" }
    password { "333333" }
    # password_digest { "333333" }
    admin { false }
  end
    
  
end
