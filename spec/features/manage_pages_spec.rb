require 'spec_helper'

describe "Feature: Managing Pages" do
  describe "Displaying the master list" do
    before do
      FactoryGirl.create_list :published_page, 15
      FactoryGirl.create_list :unpublished_page, 15
      visit sevenpages.pages_path
    end

    it "displays a table of all Pages" do
      page.should have_selector("table.pages-table")
    end

    it "shows a link to create a new Page" do
      page.should have_content "Add a Page"
      page.should have_selector '.button.add-button'
    end

    it "shows a link to edit a Page" do
      page.should have_link "Edit"
    end

    it "shows a link to delete a Page" do
      page.should have_link "Delete"
    end

    it "shows a published status" do
      page.should have_selector('.published-status.published')
      page.should have_selector('.published-status.unpublished')
    end

    it "supports paging through items" do
      page.should have_selector('nav.pagination')
    end
  end
end
