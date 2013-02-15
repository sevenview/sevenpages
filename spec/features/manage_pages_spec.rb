require 'spec_helper'

describe "Feature: Managing Pages" do
  before do
    login
  end

  describe "the index page" do
    before do
      FactoryGirl.create_list :published_page, 15
      FactoryGirl.create_list :unpublished_page, 15
      visit sevenpages.pages_path
    end

    it_behaves_like "an administrative listing page" do
      let(:resource_name) { "page" }
    end

    it "shows a published status" do
      expect(page).to have_selector('.published-status.published')
      expect(page).to have_selector('.published-status.unpublished')
    end

    it "supports paging through items" do
      expect(page).to have_selector('nav.pagination')
    end
  end

  describe "Creating a Page" do
    before do
      visit sevenpages.pages_path
      click_link 'Add a Page'
    end

    it "creates a new page when given valid data" do
      fill_in 'Title', with: 'Foo Page'
      fill_in 'Slug', with: 'foo-page'
      fill_in 'code', with: 'Foo bar baz'
      click_button 'Create Page'

      within '.flash.notice' do
        expect(page).to have_content 'Added Page'
      end

      expect(page).to have_content 'Foo Page'
    end

    it "doesn't create a new page when given invalid data" do
      fill_in 'Title', with: ''
      click_button 'Create Page'

      within '.error-messages' do
        expect(page).to have_content 'prohibited'
      end
    end
  end

  describe "Editing a Page" do
    before do
      FactoryGirl.create :page
      visit sevenpages.pages_path
      click_link 'Edit'
    end

    it "Updates the page when given valid data" do
      fill_in 'Title', with: 'Foo Bar'
      click_button 'Update Page'

      within '.flash.notice' do
        expect(page).to have_content 'Updated Page'
      end

      expect(page).to have_content 'Foo Bar'
    end

    it "Doesn't update the page when given invalid data" do
      fill_in 'Title', with: ''
      click_button 'Update Page'

      within '.error-messages' do
        expect(page).to have_content 'prohibited'
      end
    end
  end

  describe "Deleting a Page" do
    before do
      FactoryGirl.create :page, title: 'Foo'
      visit sevenpages.pages_path
    end

    it "deletes the selected page" do
      click_link 'Delete'
      within '.flash.notice' do
        expect(page).to have_content 'deleted'
      end
      expect(page).to_not have_content 'Foo'
    end
  end
end
