require 'spec_helper'

module Sevenpages
  describe ContentBlocksController do
    context "when signed in" do
      before do
        sign_in FactoryGirl.create :user
      end

      describe "GET #index" do
        it "returns http success" do
          get :index, use_route: :sevenpages
          response.should be_success
        end
      end

      describe "GET 'new'" do
        it "returns http success" do
          get :new, use_route: :sevenpages
          response.should be_success
        end
      end

      describe "GET 'edit'" do
        it "returns http success" do
          content_block = FactoryGirl.create :content_block
          get :edit, id: content_block.id, use_route: :sevenpages
          response.should be_success
        end
      end
    end
  end
end
