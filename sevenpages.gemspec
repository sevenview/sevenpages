$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sevenpages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sevenpages"
  s.version     = Sevenpages::VERSION
  s.authors     = ["Stephen Clarke"]
  s.email       = ["steve@sevenview.ca"]
  s.homepage    = "http://sevenview.ca"
  s.summary     = "An experiment in content management."
  s.description = "Bespoke CMS for our clients."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency "sqlite3"

  #s.add_development_dependency "rspec-rails"
  #s.add_development_dependency "factory_girl_rails"
  #s.add_development_dependency "capybara-webkit"

end
