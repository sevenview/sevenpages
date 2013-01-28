require 'spec_helper'

describe Sevenpages::Public::PagesController do
  describe 'GET #show' do
    before do
      cms_page = FactoryGirl.create :published_page
      get :show, slug: cms_page.slug, use_route: :sevenpages
    end

    it { should render_with_layout :application }
  end
end
