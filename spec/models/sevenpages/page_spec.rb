require 'spec_helper'

describe Sevenpages::Page do
  it { should validate_presence_of :title }
  it { should validate_presence_of :slug }
end