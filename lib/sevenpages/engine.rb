module Sevenpages
  class Engine < ::Rails::Engine
    isolate_namespace Sevenpages

    # Precompile assets - include the group: :all to ensure they get compiled
    # even on Heroku with initialize_on_precompile set to false
    # See http://timcardenas.com/how-to-develop-engines-that-compile-assets-on
    initializer "sevenpages.assets", group: :all do |app|
      # Uncomment the lines below to view the names of assets as they are
      # precompiled for the rails asset pipeline
      def compile_asset?(path)
        puts "Compiling: #{path}"
        true
      end
      app.config.assets.precompile = [ method(:compile_asset?).to_proc ]
    end


    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end

require 'kaminari'
require 'liquid'
require 'devise'
#require 'codemirror-rails'