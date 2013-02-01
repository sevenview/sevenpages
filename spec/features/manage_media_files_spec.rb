require 'spec_helper'

describe 'FEATURE: Manage Media Files' do
  before do
    login
  end

  describe "Displaying the list" do
    it "shows a set of all media files" do
      FactoryGirl.create :media_file
      visit sevenpages.media_files_path
      page.should have_selector('.media_file')
    end
  end

  describe 'Adding a media file' do
    it 'creates a media file with valid file type' do
      visit sevenpages.media_files_path
      click_link "Add a Media File"
      attach_file('media_file_source', File.join(Rails.root, '../fixtures/media_files/valid_image.jpg'))
      click_button 'Upload Media File'
      page.should have_content 'uploaded'
    end

    it "doesn't create a media file with missing fields" do
      visit sevenpages.media_files_path
      click_link "Add a Media File"
      click_button "Upload Media File"
      page.should have_content /error/
      page.should have_selector '.error-messages'
      page
    end
  end
end