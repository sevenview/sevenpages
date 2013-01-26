module Sevenpages
  module ApplicationHelper
    def form_page_header(item_name)
      raw("<h2>#{action_name.capitalize} #{item_name.capitalize}</h2>")
    end

    def error_messages_for(obj)
      content = ""
      if obj.errors.any?
        content << '<div class="error-messages">'
        content << "<h2>#{pluralize(obj.errors.count, "error")} prohibited this form from being saved:</h2>"
        content << "<ul>"
        obj.errors.full_messages.each do |msg|
          content << "<li>#{msg}</li>"
        end
        content << "</ul>"
        content << "</div>"
      end
      return raw(content) if content
    end
  end
end
