require 'spec_helper'

module Sevenpages
  describe Page do

    it { should allow_mass_assignment_of :title }
    it { should allow_mass_assignment_of :slug }
    it { should allow_mass_assignment_of :content }
    it { should allow_mass_assignment_of :published }

    describe "validations" do
      it { should validate_presence_of :title }
      it { should validate_presence_of :slug }

      it "requires a unique slug" do
        FactoryGirl.create :page, slug: 'foo-bar'
        page = FactoryGirl.build(:page, slug: 'foo-bar')
        page.should_not be_valid
        page.errors[:slug].should == ["has already been taken"]
      end

      it "doesn't allow reserved slug names" do
        Sevenpages.reserved_slugs << 'reserved-slug'
        page = FactoryGirl.build(:page, slug: 'reserved-slug')
        page.should_not be_valid
        page.errors[:slug].should == ['is reserved']
      end
    end

    it "is unpublished by default" do
      page = FactoryGirl.create :page
      page.should_not be_published
    end

    describe ".published" do
      it "returns only published pages" do
        FactoryGirl.create :published_page
        FactoryGirl.create :unpublished_page
        Sevenpages::Page.published.should have(1).items
        Sevenpages::Page.first.should be_published
        Sevenpages::Page.last.should_not be_published
      end
    end
  end
end
