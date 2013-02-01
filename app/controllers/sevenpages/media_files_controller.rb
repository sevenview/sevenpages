require_dependency "sevenpages/application_controller"

module Sevenpages
  class MediaFilesController < ApplicationController
    def index
      @media_files = MediaFile.page_number(params[:pg]).per(10)
    end
  
    def new
    end
  
    def edit
    end
  end
end
