$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sevenpages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sevenpages"
  s.version     = Sevenpages::VERSION
  s.authors     = ["Stephen Clarke"]
  s.email       = ["steve@sevenview.ca"]
  s.homepage    = "http://github.com/sevenview/sevenpages"
  s.summary     = "An experiment in content management."
  s.description = "An experiment in content management."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency "kaminari"
  s.add_dependency "liquid", "~> 2.4.1"
  s.add_dependency "devise"
  s.add_dependency "carrierwave"
  s.add_dependency "fog"
  s.add_dependency "rmagick"
  s.add_dependency "codemirror-rails"
  s.add_dependency "tinymce-rails"
  s.add_dependency "compass-rails"
  s.add_dependency "zurb-foundation", "~>3.2.5"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "launchy"
  s.add_development_dependency "fivemat"
  s.add_development_dependency "ffaker"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rb-fsevent"
  s.add_development_dependency "growl"
end
