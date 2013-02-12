require_dependency "sevenpages/application_controller"

module Sevenpages
  class ContentBlocksController < ApplicationController
    def index
      @content_blocks = ContentBlock.page_number(params[:pg])
    end
  
    def new
      @content_block = ContentBlock.new
    end

    def create
      @content_block = ContentBlock.new(params[:content_block])

      if @content_block.save
        redirect_to content_blocks_path, notice: 'Content Added'
      else
        render :new
      end
    end
  
    def edit
      @content_block = ContentBlock.find(params[:id])
    end

    def update
      @content_block = ContentBlock.find(params[:id])

      if @content_block.update_attributes(params[:content_block])
        redirect_to content_blocks_path, notice: 'Updated Content'
      else
        render :edit
      end
    end

    def destroy
      @content_block = ContentBlock.find(params[:id])

      if @content_block.destroy
        redirect_to content_blocks_path, notice: 'Content deleted'
      else
        redirect_to content_blocks_path, alert: 'Error deleting content'
      end
    end
  end
end
