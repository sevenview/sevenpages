module Sevenpages
  module Liquid
    module Tags
      class ContentBlockTag < ::Liquid::Tag
        Syntax = /(#{::Liquid::QuotedString})/

        # Usage {% content "Title" %}
        def initialize(tag_name, content_block_title, tokens)
          if content_block_title =~ Syntax
            @content_block_title = $1[1..-2]
          else
            raise ::Liquid::SyntaxError.new("Syntax Error in 'content'")
          end
          super
        end

        def render(context)
          content_block = Sevenpages::ContentBlock.find_by_title!(@content_block_title)
          content_block.content
        rescue ActiveRecord::RecordNotFound
            return %Q(Liquid Error: Content block titled "#{@content_block_title}" could not be found.)
        end
      end
    end
  end
end

::Liquid::Template.register_tag('content', Sevenpages::Liquid::Tags::ContentBlockTag)