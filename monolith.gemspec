require File.expand_path("../lib/monolith/version", __FILE__)

Gem::Specification.new do |s|
  s.author                = "Sean Huber"
  s.email                 = "github@shuber.io"
  s.extra_rdoc_files      = %w(LICENSE)
  s.files                 = `git ls-files`.split("\n")
  s.homepage              = "https://github.com/shuber/monolith"
  s.license               = "MIT"
  s.name                  = "monolith"
  s.rdoc_options          = %w(--charset=UTF-8 --inline-source --line-numbers --main README.md)
  s.require_paths         = %w(lib)
  s.required_ruby_version = ">= 2.0.0"
  s.summary               = "Monolithic git repository generator"
  s.test_files            = `git ls-files -- spec/*`.split("\n")
  s.version               = Monolith::VERSION

  s.add_dependency "cocaine"
  s.add_dependency "colorize"
  s.add_dependency "formatador"
  s.add_dependency "thor"

  s.add_development_dependency "rspec"
end
