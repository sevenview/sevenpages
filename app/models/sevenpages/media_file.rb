module Sevenpages
  class MediaFile < ActiveRecord::Base
    attr_accessible :source

    # -- CarrierWave --
    mount_uploader :source, MediaFileUploader
  end
end
