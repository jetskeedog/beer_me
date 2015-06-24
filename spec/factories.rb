FactoryGirl.define do
  factory :user do
    username "archer"
    password  "nooneknows"
    email { "#{username}@test.com" }
  end
end