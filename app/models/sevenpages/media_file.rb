module Sevenpages
  class MediaFile < ActiveRecord::Base
    attr_accessible :source

    # -- Validations --
    validates :source, presence: true

    # -- CarrierWave --
    mount_uploader :source, MediaFileUploader
  end
end
