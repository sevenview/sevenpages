require_dependency "sevenpages/application_controller"

module Sevenpages
  class ImagesController < ApplicationController
    def index
      @images = Image.page_number(params[:pg]).per(10)
    end
  
    def new
      @image = Image.new
    end

    def create
      @image = Image.new(params[:image])

      if @image.save
        redirect_to images_path, notice: 'Image successfully uploaded'
      else
        render :new
      end
    end
  
    def edit
      @image = Image.find(params[:id])
    end

    def update
      @image = Image.find(params[:id])

      if @image.update_attributes(params[:image])
        redirect_to images_path, notice: 'Updated Image'
      else
        render :edit
      end
    end

    def destroy
      @image = Image.find(params[:id])

      if @image.destroy
        redirect_to images_path, notice: 'Deleted Image'
      end
    end
  end
end
