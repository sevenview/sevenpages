require_dependency "sevenpages/application_controller"

module Sevenpages
  class PagesController < ApplicationController
    def index
      @pages = Page.page_number(params[:pg]).per(25).order("title")
    end
  
    def new
      @page = Page.new
    end

    def create
      @page = Page.new(params[:page])

      if @page.save
        redirect_to pages_path, notice: "Added Page"
      else
        flash.alert = "Error adding page"
        render :new
      end
    end
  
    def edit
      @page = Page.find(params[:id])
    end

    def content_edit
      @page = Page.find(params[:id])
      render layout: nil
    end

    def update
      @page = Page.find(params[:id])

      if @page.update_attributes(params[:page])
        redirect_to pages_path, notice: 'Updated Page'
      else
        flash.alert = "Error updating page"
        render :edit
      end
    end

    def destroy
      @page = Page.find(params[:id])

      if @page.destroy
        redirect_to pages_path, notice: 'Page deleted'
      end
    end
  end
end