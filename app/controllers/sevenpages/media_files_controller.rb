require_dependency "sevenpages/application_controller"

module Sevenpages
  class MediaFilesController < ApplicationController
    def index
      @media_files = MediaFile.page_number(params[:pg]).per(10)
    end
  
    def new
      @media_file = MediaFile.new
    end

    def create
      @media_file = MediaFile.new(params[:media_file])

      if @media_file.save
        redirect_to media_files_path, notice: 'Media File successfully uploaded'
      else
        render :new
      end
    end
  
    def edit
      @media_file = MediaFile.find(params[:id])
    end

    def update
      @media_file = MediaFile.find(params[:id])

      if @media_file.update_attributes(params[:media_file])
        redirect_to media_files_path, notice: 'Updated Media File'
      else
        render :edit
      end
    end

    def destroy
      @media_file = MediaFile.find(params[:id])

      if @media_file.destroy
        redirect_to media_files_path, notice: 'Deleted Media File'
      end
    end
  end
end
