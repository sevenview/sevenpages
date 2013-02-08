module Sevenpages
  class MediaFile < ActiveRecord::Base
    attr_accessible :source, :title

    # -- Validations --
    validates :source, :title, presence: true

    # -- CarrierWave --
    mount_uploader :source, MediaFileUploader
  end
end
