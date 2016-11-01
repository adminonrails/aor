$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aor/authentication/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aor-authentication"
  s.version     = Aor::Authentication::VERSION
  s.authors     = ["ciro9527"]
  s.email       = ["ciro9527@gmail.com"]
  s.homepage    = "https://adminonrails.github.io"
  s.summary     = "authentication"
  s.description = "authentication"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "bcrypt"
end
