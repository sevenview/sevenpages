module Sevenpages
  class Page < ActiveRecord::Base
    attr_accessible :content, :published, :slug, :title

    validates :title, :slug, presence: true
    validates :slug, uniqueness: true
    validates_exclusion_of :slug, in: Sevenpages.reserved_slugs

    liquid_methods :title

    scope :published, -> {
      where(published: true)
    }

  end
end
