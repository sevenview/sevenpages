require 'spec_helper'

describe "Feature: Viewing content pages" do
  it "shows the correct content for a given valid slug" do
    cms_page = FactoryGirl.create :published_page, content: 'Foofy'
    visit main_app.page_path(cms_page.slug)
    page.should have_content(cms_page.content)
  end

  it "shows the 404 page given an invalid slug" do
    visit main_app.page_path('foofy')
    page.should have_content "doesn't exist"
  end
end