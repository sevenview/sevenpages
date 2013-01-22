require 'spec_helper'

module Sevenpages
  describe PagesController do
  
    describe "GET index" do
      before do
        FactoryGirl.create :page
        get :index, use_route: :sevenpages
      end

      it { should respond_with :success }
      it { should render_template :index }
      it { should assign_to(:pages) }
    end

    describe "GET new" do
      before do
        get :new, use_route: :sevenpages
      end

      it { should respond_with :success }
      it { should render_template :new }
      it { should assign_to(:page) }
    end

    describe "GET edit" do
      let(:page) { FactoryGirl.create :page }

      before do
        get :edit, id: page.id, use_route: :sevenpages
      end

      it { should respond_with :success }
      it { should render_template :edit }
      it { should assign_to(:page).with_kind_of(Page) }
    end
  
  end
end
