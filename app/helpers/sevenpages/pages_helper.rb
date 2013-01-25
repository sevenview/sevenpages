module Sevenpages
  module PagesHelper
    def published_status(page)
      if page.published?
        css_class = 'published'
        text = 'Yes'
      else
        css_class = 'unpublished'
        text = 'No'
      end
      raw(%{<span class="published-status #{css_class}">#{text}</span>})
    end
  end
end