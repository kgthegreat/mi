# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alert do
    title "MyString"
    description "MyText"
    date "2012-06-17"
    venue "MyString"
  end
end
