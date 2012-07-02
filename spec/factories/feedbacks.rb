# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    title "MyString"
    description "MyText"
    schedule
  end
end
