FactoryGirl.define do
  factory :trainer do
    email 'trainer@some.com'
    password 'password'
  end
  factory :timeslot do
    date '19-5-2012'
    start_time Time.now
    trainer
  end
  factory :admin do
    email 'admin@some.com'
    password 'password'
  end
  factory :user do
    email 'user@some.com'
    password 'password'
  end
  factory :domain do
    name 'somedomain'
  end


end
