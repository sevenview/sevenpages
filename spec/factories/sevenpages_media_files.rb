# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sevenpages_media_file, :class => 'MediaFile' do
    source "MyString"
  end
end
