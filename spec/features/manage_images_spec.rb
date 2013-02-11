require 'spec_helper'

describe 'FEATURE: Managing Images:' do
  before do
    login
  end

  describe 'Displaying the list' do
    before do
      FactoryGirl.create :image
      visit sevenpages.images_path
    end

    it 'shows a set of all media files' do
      page.should have_selector('.image')
    end

    it 'shows the image short-code' do
      page.should have_content '{% image "Logo" %}'
    end

    it 'allows the image short-code to be copied to clipboard'

    it 'shows the image title' do
      within '.images' do
        page.should have_content 'Title'
        page.should have_content 'Logo'
      end
    end
  end

  describe 'Adding an image' do
    it 'creates an image with valid file type' do
      visit sevenpages.images_path
      click_link "Add an Image"
      fill_in 'Title', with: 'Logo'
      attach_file('image_source', fixture_file_path('valid_image.jpg'))
      click_button 'Create Image'
      page.should have_content 'uploaded'
    end

    it "doesn't create an image with missing fields" do
      visit sevenpages.images_path
      click_link "Add an Image"
      click_button "Create Image"
      page.should have_content /error/
      page.should have_selector '.error-messages'
    end

    it 'only allows image files' do
      visit sevenpages.images_path
      click_link "Add an Image"
      attach_file('image_source', fixture_file_path('invalid_image.txt'))
      click_button "Create Image"
      page.should have_content /error/
    end
  end

  describe 'Updating an image' do
    it 'updates an image with valid data' do
      FactoryGirl.create :image
      visit sevenpages.images_path
      click_link 'edit'
      click_button "Update Image"
      page.should have_content /updated/i
    end

    it 'allows an image to be replaced' do
      image = FactoryGirl.create :image
      visit sevenpages.edit_image_path(image)
      page.should have_selector('img[src*=valid_image]')
      attach_file('image_source', fixture_file_path('replacement_image.jpg'))
      click_button "Update Image"
      page.should have_selector('img[src*=replacement_image]')
    end
  end

  describe 'Deleting an image' do
    it 'deletes the image' do
      FactoryGirl.create :image
      visit sevenpages.images_path
      click_link 'delete'
      page.should have_content /deleted/i
    end
  end

end
