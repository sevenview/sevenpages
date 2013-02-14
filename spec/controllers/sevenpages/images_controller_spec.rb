require 'spec_helper'

module Sevenpages
  describe ImagesController do
    before do
      sign_in FactoryGirl.create :user
    end

    describe "GET 'index'" do
      it "returns http success" do
        get 'index', use_route: :sevenpages
        expect(response).to be_success
      end
    end
  
    describe "GET 'new'" do
      it "returns http success" do
        get 'new', use_route: :sevenpages
        expect(response).to be_success
      end
    end
  
    describe "GET 'edit'" do
      it "returns http success" do
        image = FactoryGirl.create :image
        get 'edit', id: image.id , use_route: :sevenpages
        expect(response).to be_success
      end
    end
  
  end
end
