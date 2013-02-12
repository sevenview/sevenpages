require 'ffaker'

FactoryGirl.define do
  factory :content_block, class: Sevenpages::ContentBlock do
    title { Faker::Lorem.words(2).join(' ').titleize }
    content { Faker::HTMLIpsum.p(100) }
  end
end
