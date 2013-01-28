module Sevenpages
  module Public
    class PagesController < ::ApplicationController
      def show
        @page = Page.published.find_by_slug!(params[:slug])
      rescue ActiveRecord::RecordNotFound
        render file: "#{Rails.root}/public/404", layout: false, status: 404
      end
    end
  end
end