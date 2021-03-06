require 'ffaker'

FactoryGirl.define do
  factory :page, class: Sevenpages::Page do
    title { Faker::Lorem.words(4).join(' ').titleize }
    slug  { title.parameterize }
    content { Faker::HTMLIpsum.p(100) }

    factory :published_page do
      published true
    end

    factory :unpublished_page do
      published false
    end
  end
end
