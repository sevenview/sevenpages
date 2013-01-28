require 'spec_helper'

describe Sevenpages::Public::PagesController do
  describe 'GET #show' do
    before do
      get :show, use_route: :sevenpages
    end

    it { should render_with_layout nil }
  end
end
