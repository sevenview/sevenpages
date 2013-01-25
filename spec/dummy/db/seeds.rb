require 'factory_girl_rails'

puts "Pages..."
Sevenpages::Page.destroy_all
FactoryGirl.create_list(:published_page, 15)
FactoryGirl.create_list(:unpublished_page, 15)
