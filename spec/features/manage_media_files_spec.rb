require 'spec_helper'

describe 'FEATURE: Managing Media Files:' do
  before do
    login
  end

  describe 'Displaying the list' do
    before do
      FactoryGirl.create :media_file
      visit sevenpages.media_files_path
    end

    it 'shows a set of all media files' do
      page.should have_selector('.media_file')
    end

    it 'shows the image short-code' do
      page.should have_content '{{ image "Logo" }}'
    end

    it 'allows the image short-code to be copied to clipboard'

    it 'shows the image title' do
      within '.media_files' do
        page.should have_content 'Title'
        page.should have_content 'Logo'
      end
    end
  end

  describe 'Adding a media file' do
    it 'creates a media file with valid file type' do
      visit sevenpages.media_files_path
      click_link "Add a Media File"
      fill_in 'Title', with: 'Logo'
      attach_file('media_file_source', fixture_file_path('valid_image.jpg'))
      click_button 'Create Media file'
      page.should have_content 'uploaded'
    end

    it "doesn't create a media file with missing fields" do
      visit sevenpages.media_files_path
      click_link "Add a Media File"
      click_button "Create Media file"
      page.should have_content /error/
      page.should have_selector '.error-messages'
    end

    it 'only allows image files' do
      visit sevenpages.media_files_path
      click_link "Add a Media File"
      attach_file('media_file_source', fixture_file_path('invalid_image.txt'))
      click_button "Create Media file"
      page.should have_content /error/
    end
  end

  describe 'Updating a media file' do
    it 'updates a media file with valid data' do
      FactoryGirl.create :media_file
      visit sevenpages.media_files_path
      click_link 'edit'
      click_button "Update Media file"
      page.should have_content /updated/i
    end

    it 'allows an image to be replaced' do
      media_file = FactoryGirl.create :media_file
      visit sevenpages.edit_media_file_path(media_file)
      page.should have_selector('img[src*=valid_image]')
      attach_file('media_file_source', fixture_file_path('replacement_image.jpg'))
      click_button "Update Media file"
      page.should have_selector('img[src*=replacement_image]')
    end
  end

  describe 'Deleting a media file' do
    it 'deletes the media file' do
      FactoryGirl.create :media_file
      visit sevenpages.media_files_path
      click_link 'delete'
      page.should have_content /deleted/i
    end
  end

end
