require 'spec_helper'

describe "Feature: Viewing content pages" do
  it "shows the correct content for a given valid slug" do
    cms_page = FactoryGirl.create :published_page, content: 'Foofy'
    visit main_app.page_path(cms_page.slug)
    expect(page).to have_content(cms_page.content)
  end

  it "shows the 404 page given an invalid slug" do
    visit main_app.page_path('foofy')
    expect(page).to have_content "doesn't exist"
  end

  it "renders liquid tags properly" do
    cms_page = FactoryGirl.create :published_page, title: 'Foo',
                                  content: "{{ page.title | upcase }} Bar"
    visit main_app.page_path(cms_page.slug)
    expect(page).to have_content "FOO Bar"
  end
end