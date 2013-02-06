module Sevenpages
  class Engine < ::Rails::Engine
    isolate_namespace Sevenpages

    # Precompile assets
    initializer "sevenpages.assets" do |app|
      app.config.assets.precompile += ['sevenpages/codemirror/*']
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