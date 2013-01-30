require 'spec_helper'

module Sevenpages
  describe PagesController do
    context "when signed in" do
      before do
        sign_in FactoryGirl.create :user
      end

      describe "GET #index" do
        before do
          FactoryGirl.create :page
          get :index, use_route: :sevenpages
        end

        it { should respond_with :success }
        it { should render_template :index }
        it { should assign_to(:pages) }
      end

      describe "GET #new" do
        before do
          get :new, use_route: :sevenpages
        end

        it { should respond_with :success }
        it { should render_template :new }
        it { should assign_to(:page) }
      end

      describe "POST #create" do
        context "with valid attributes" do
          it "creates the page" do
            expect {
              post :create, page: FactoryGirl.attributes_for(:page), use_route: :sevenpages
            }.to change(Page, :count).by(1)
          end
        end

        context "with invalid attributes" do
          it "doesn't create the page" do
            expect {
              post :create, page: { title: '' }, use_route: :sevenpages
            }.to_not change(Page, :count)
          end
        end
      end

      describe "GET #edit" do
        let(:page) { FactoryGirl.create :page }

        before do
          get :edit, id: page.id, use_route: :sevenpages
        end

        it { should respond_with :success }
        it { should render_template :edit }
        it { should assign_to(:page).with_kind_of(Page) }
      end

      describe "DELETE #destroy" do
        it "deletes a page" do
          page = FactoryGirl.create(:page)
          expect {
            delete :destroy, id: page.id, use_route: :sevenpages
          }.to change(Page, :count).by(-1)
        end
      end
    end
  end
end
