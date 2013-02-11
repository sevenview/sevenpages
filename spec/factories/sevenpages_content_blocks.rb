# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sevenpages_content_block, :class => 'ContentBlock' do
    title "MyString"
    content "MyText"
  end
end
