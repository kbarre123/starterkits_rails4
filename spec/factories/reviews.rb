# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    reviewer "MyString"
    body "MyText"
    rating 1
    business nil
  end
end
