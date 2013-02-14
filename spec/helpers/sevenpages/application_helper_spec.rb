require 'spec_helper'

module Sevenpages
  describe ApplicationHelper do
    describe "#form_page_header" do
      it "generates a header for standard CRUD form pages" do
        helper.stub(:action_name).and_return('create')
        expect(helper.form_page_header('foo')).to eq('<h2>Create Foo</h2>')
      end
    end
  end
end