require 'spec_helper'

describe 'FEATURE: Manage Media Files:' do
  before do
    login
  end

  describe 'Displaying the list' do
    it 'shows a set of all media files' do
      FactoryGirl.create :media_file
      visit sevenpages.media_files_path
      page.should have_selector('.media_file')
    end

    it 'shows the image short-code'
    it 'allows the image short-code to be copied to clipboard'
    it 'shows the image title'
  end

  describe 'Adding a media file' do
    it 'creates a media file with valid file type' do
      visit sevenpages.media_files_path
      click_link "Add a Media File"
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
      page
    end

    it 'only allows image files'
  end

  describe 'Updating a media file' do
    it 'updates a media file with valid data' do
      FactoryGirl.create :media_file
      visit sevenpages.media_files_path
      click_link 'edit'
      click_button "Update Media file"
      page.should have_content /updated/i
    end

    it 'allows an image to be replaced'
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