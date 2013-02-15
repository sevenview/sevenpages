require 'spec_helper'

describe "FEATURE: Manage Content Blocks" do
  before do
    login
  end

  describe "the index page" do
    before do
      FactoryGirl.create_list(:content_block, 2)
      visit sevenpages.content_blocks_path
    end

    it_behaves_like "an administrative listing page" do
      let(:resource_name) { "content_block" }
    end
  end

  describe "Creating a Content Block" do
    before do
      visit sevenpages.content_blocks_path
      click_link 'Add Content'
    end

    it "creates a Content Block given valid attributes" do
      fill_in 'Title', with: "My Content"
      click_button 'Create Content block'
      expect(page).to have_content 'Content Added'
    end

    it "doesn't create a content block when given invalid attributes" do
      click_button 'Create Content block'
      expect(page).to have_selector('.error-messages')
      expect(page).to have_content('error')
    end
  end

  describe "Editing a content block" do
    before do
      @content_block = FactoryGirl.create(:content_block)
      visit sevenpages.content_blocks_path
    end

    it "updates a content block" do
      click_link 'Edit'
      fill_in 'Title', with: "Foofy"
      click_button 'Update Content block'
      expect(page).to have_content /updated/i
      expect(page).to have_content 'Foofy'
    end

    it "doesn't update when given invalid attributes" do
      click_link 'Edit'
      fill_in 'Title', with: ''
      click_button 'Update Content block'
      expect(page).to have_selector('.error-messages')
    end
  end

  describe "Deleting a content block" do
    it "deletes a content block" do
      FactoryGirl.create(:content_block, title: 'Foofy')
      visit sevenpages.content_blocks_path
      click_link 'Delete'
      expect(page).to have_content /deleted/i
      expect(page).to_not have_content 'Foofy'
    end
  end
end