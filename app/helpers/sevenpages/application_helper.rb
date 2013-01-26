module Sevenpages
  module ApplicationHelper
    def form_page_header(item_name)
      raw("<h2>#{action_name.capitalize} #{item_name.capitalize}</h2>")
    end
  end
end
