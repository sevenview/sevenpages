module Sevenpages
  class Image < ActiveRecord::Base
    attr_accessible :source, :title

    # -- Validations --
    validates :source, :title, presence: true

    # -- CarrierWave --
    mount_uploader :source, ImageUploader
  end
end
