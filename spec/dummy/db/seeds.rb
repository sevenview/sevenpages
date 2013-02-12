require 'factory_girl_rails'

puts "Pages..."
Sevenpages::Page.destroy_all
FactoryGirl.create_list(:published_page, 15)
FactoryGirl.create_list(:unpublished_page, 15)

puts "Users..."
Sevenpages::User.destroy_all
Sevenpages::User.create email: 'admin@example.com', password: 'p@ssword1'

puts "Images..."
Sevenpages::Image.destroy_all
FactoryGirl.create(:image)

puts "Content"
Sevenpages::ContentBlock.destroy_all
FactoryGirl.create_list(:content_block, 5)