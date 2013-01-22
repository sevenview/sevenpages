require_dependency "sevenpages/application_controller"

module Sevenpages
  class PagesController < ApplicationController
    def index
      @pages = Page.all
    end
  
    def new
      @page = Page.new
    end
  
    def edit
      @page = Page.find(params[:id])
    end
  end
end
