require 'spec_helper'

module Sevenpages
  describe MediaFile do
    it { should allow_mass_assignment_of :source }
    it { should allow_mass_assignment_of :title }
    it { should validate_presence_of :source }
    it { should validate_presence_of :title }
  end
end
