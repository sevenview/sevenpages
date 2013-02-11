require 'spec_helper'

module Sevenpages
  describe ContentBlock do
    it { should validate_presence_of :title }
  end
end
