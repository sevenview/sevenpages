require File.join(File.dirname(__FILE__), '../support/fixtures')

FactoryGirl.define do
  factory :image, class: Sevenpages::Image do
    source fixture_file('valid_image.jpg')
    title 'Logo'
  end
end