require File.join(File.dirname(__FILE__), '../support/fixtures')

FactoryGirl.define do
  factory :media_file, class: Sevenpages::MediaFile do
    source fixture_file('valid_image.jpg')
  end
end