# -*- encoding: utf-8 -*-
# stub: sinatra-cache 0.3.7 ruby lib

Gem::Specification.new do |s|
  s.name = "sinatra-cache".freeze
  s.version = "0.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["kematzy".freeze]
  s.date = "2011-04-08"
  s.description = "A Sinatra Extension that makes Page and Fragment Caching easy.".freeze
  s.email = "kematzy@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.files = ["LICENSE".freeze, "README.rdoc".freeze]
  s.homepage = "http://github.com/kematzy/sinatra-cache".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.1.3".freeze
  s.summary = "A Sinatra Extension that makes Page and Fragment Caching easy.".freeze

  s.installed_by_version = "3.1.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sinatra>.freeze, [">= 1.1.0"])
    s.add_runtime_dependency(%q<sinatra-outputbuffer>.freeze, [">= 0.1.0"])
    s.add_development_dependency(%q<sinatra-tests>.freeze, [">= 0.1.6"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 1.3.0"])
  else
    s.add_dependency(%q<sinatra>.freeze, [">= 1.1.0"])
    s.add_dependency(%q<sinatra-outputbuffer>.freeze, [">= 0.1.0"])
    s.add_dependency(%q<sinatra-tests>.freeze, [">= 0.1.6"])
    s.add_dependency(%q<rspec>.freeze, [">= 1.3.0"])
  end
end
