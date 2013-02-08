module Sevenpages
  class Engine < ::Rails::Engine
    isolate_namespace Sevenpages

    initializer "sevenpages.assets", group: :all do |app|
      app.config.assets.precompile += [
          'codemirror.css',
          'codemirror.js',
          'codemirror/*',
          'sevenpages/codemirror_include.css',
          'sevenpages/codemirror_include.js'
      ]
      
      #Uncomment the lines below to view the names of assets as they are
      #precompiled for the rails asset pipeline
      #def compile_asset?(path)
      #  puts "Compiling: #{path}"
      #  true
      #end
      #app.config.assets.precompile = [ method(:compile_asset?).to_proc ]
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
require 'codemirror-rails'
require 'compass-rails'
require 'zurb-foundation'