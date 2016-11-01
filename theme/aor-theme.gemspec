$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aor/theme/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aor-theme"
  s.version     = Aor::Theme::VERSION
  s.authors     = ["ciro9527"]
  s.email       = ["ciro9527@gmail.com"]
  s.homepage    = "https://adminonrails.github.io"
  s.summary     = "theme"
  s.description = "theme"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"
  s.add_dependency "aor-bootstrap", "~> 3.0"
  s.add_dependency "aor-authentication", "~> 0.0"
  s.add_dependency "aor-authorization", "~> 0.0"

  s.add_development_dependency "sqlite3"
end
