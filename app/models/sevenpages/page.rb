module Sevenpages
  class Page < ActiveRecord::Base
    attr_accessible :content, :published, :slug, :title
  end
end
