$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aor/bootstrap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aor-bootstrap"
  s.version     = Aor::Bootstrap::VERSION
  s.authors     = ["ciro9527"]
  s.email       = ["ciro9527@gmail.com"]
  s.homepage    = "https://adminonrails.github.io"
  s.summary     = "bootstrap"
  s.description = "bootstrap"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"

  s.add_development_dependency "sqlite3"
end
