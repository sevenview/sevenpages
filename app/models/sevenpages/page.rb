module Sevenpages
  class Page < ActiveRecord::Base
    attr_accessible :content, :published, :slug, :title
    validates :title, :slug, presence: true
  end
end
