FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password "12345678"
    password_confirmation "12345678"
    first_name "anh"
    last_name "nguyen"
    # open_id Devise.friendly_token
  end

  trait :reset_password do
    reset_password_token "492ac6073c2dce0e8c6fb230267eaf7737f5776f26e8f287d085d7834d42329c"
    reset_password_sent_at "2015-11-01 16:39:49"
  end

  trait :confirmed do
    confirmed_at "2015-11-01 07:43:54"
  end

  trait :confirmation_token do
    confirmation_token "1234567890"
  end
end
