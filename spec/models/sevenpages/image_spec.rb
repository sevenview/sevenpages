require 'spec_helper'
require 'carrierwave/test/matchers'

module Sevenpages
  describe Image do
    include CarrierWave::Test::Matchers

    it { should allow_mass_assignment_of :source }
    it { should allow_mass_assignment_of :title }
    it { should validate_presence_of :source }
    it { should validate_presence_of :title }

    describe "Uploader" do
      it "creates a thumbnail version" do
        Sevenpages::ImageUploader.enable_processing = true
        image = FactoryGirl.create :image
        image.source.thumb.should have_dimensions(100,100)
      end
    end
  end
end
