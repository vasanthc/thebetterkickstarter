require 'factory_girl'

FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "test#{n}@test.com" }
    sequence(:username) {|n| "test_user_#{n}" }
    password "test"
  end

end

# User.create :email => "test0@test.com", :username => "test_user_0", :password => "test"
# # /\
# # equivalent
# # \/
# FactoryGirl.create :user

# # Overriding the defaults:
# FactoryGirl.create :user, :username => "te"