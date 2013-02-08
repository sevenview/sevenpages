module Sevenpages
  module Liquid
    module Tags
      class ImageTag < ::Liquid::Tag
        Syntax = /(#{::Liquid::QuotedString})/

        # Usage {% image "Title" %}
        def initialize(tag_name, image_title, tokens)
          if image_title =~ Syntax
            @image_title = $1[1..-2]
          else
            raise ::Liquid::SyntaxError.new("Syntax Error in 'image'")
          end
          super
        end

        def render(context)
          begin
            image = Sevenpages::MediaFile.find_by_title!(@image_title)
          rescue ActiveRecord::RecordNotFound
            return %Q(Liquid Error: Image titled "#{@image_title}" could not be found.)
          end

          ActionController::Base.helpers.image_tag(image.source.url, alt: image.title)
        end
      end
    end
  end
end

::Liquid::Template.register_tag('image', Sevenpages::Liquid::Tags::ImageTag)