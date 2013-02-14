require 'spec_helper'

module Sevenpages
  describe PagesHelper do

    describe "#published_status" do
      it "sets the CSS class to .published when the page is published" do
        page = FactoryGirl.create :published_page
        expect(helper.published_status(page)).to match(/class="published-status published"/)
      end

      it "sets the CSS class to .unpublished set when the page is unpublished" do
        page = FactoryGirl.create :unpublished_page
        expect(helper.published_status(page)).to match(/class="published-status unpublished"/)
      end
    end

  end
end