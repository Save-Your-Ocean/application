# -*- encoding: utf-8 -*-
# stub: authlane 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "authlane".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Patrick Lam".freeze]
  s.date = "2015-04-01"
  s.description = "    The AuthLane Sinatra Extension allows simple User authentication with support\n    for different User roles. It comes with Sinatra helpers for easy integration into routes.\n".freeze
  s.email = ["zidizei@gmail.com".freeze]
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.1.3".freeze
  s.summary = "Simple User authentication and roles for Sinatra.".freeze

  s.installed_by_version = "3.1.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sinatra>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<sinatra-contrib>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.1"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 2.6"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
  else
    s.add_dependency(%q<sinatra>.freeze, [">= 0"])
    s.add_dependency(%q<sinatra-contrib>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.6"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
  end
end
