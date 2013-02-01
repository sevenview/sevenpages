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
end