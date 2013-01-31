require 'spec_helper'

module Sevenpages
  describe MediaFile do
    it { should allow_mass_assignment_of :source }
  end
end
