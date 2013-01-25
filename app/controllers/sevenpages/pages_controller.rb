require_dependency "sevenpages/application_controller"

module Sevenpages
  class PagesController < ApplicationController
    def index
      @pages = Page.page_number(params[:pg]).per(25).order("title")
    end
  
    def new
      @page = Page.new
    end
  
    def edit
      @page = Page.find(params[:id])
    end
  end
end
