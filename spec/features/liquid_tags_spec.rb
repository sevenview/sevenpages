require 'spec_helper'

describe "FEATURE: Displaying Liquid tags" do
  describe "{% image 'Title' %}" do
    it "renders an HTML image tag" do
      FactoryGirl.create :image, title: 'Logo'
      FactoryGirl.create :published_page, slug: 'logo', content: '{% image "Logo" %}'
      visit page_path('logo')
      page.should have_selector("img[src*=valid_image]")
      page.should have_selector("img[alt*=Logo]")
    end

    it "shows an appropriate error when the image could not be found" do
      FactoryGirl.create :published_page, slug: 'logo', content: '{% image "foofy" %}'
      visit page_path('logo')
      page.should have_content %Q(Liquid Error: Image titled "foofy" could not be found.)
    end
  end
end