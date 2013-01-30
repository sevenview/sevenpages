FactoryGirl.define do
  factory :user, class: Sevenpages::User do
    email    'admin@example.org'
    password 'p@ssword1'
  end
end
