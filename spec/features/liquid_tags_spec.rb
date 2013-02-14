require 'spec_helper'

describe "FEATURE: Displaying Liquid tags" do
  describe "{% image 'Title' %}" do
    it "renders an HTML image tag" do
      FactoryGirl.create :image, title: 'Logo'
      FactoryGirl.create :published_page, slug: 'logo', content: '{% image "Logo" %}'
      visit page_path('logo')
      expect(page).to have_selector("img[src*=valid_image]")
      expect(page).to have_selector("img[alt*=Logo]")
    end

    it "shows an appropriate error when the image could not be found" do
      FactoryGirl.create :published_page, slug: 'logo', content: '{% image "foofy" %}'
      visit page_path('logo')
      expect(page).to have_content %Q(Liquid Error: Image titled "foofy" could not be found.)
    end
  end

  describe "{% content 'Title' %}" do
    it "renders the content from the specified ContentBlock" do
      FactoryGirl.create :content_block, title: "Foofy", content: "test content block"
      FactoryGirl.create :published_page,
                         slug: 'test',
                         content: '{% content "Foofy" %}'
      visit page_path('test')
      expect(page).to have_content "test content block"
    end

    it "shows an appropriate error when the content block could not be found" do
      FactoryGirl.create :published_page,
                         slug: 'test',
                         content: '{% content "Foofy" %}'
      visit page_path('test')
      expect(page).to have_content %Q(Liquid Error: Content block titled "Foofy" could not be found.)
    end
  end
end
