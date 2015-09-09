# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "activepesel"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["voytee"]
  s.date = "2012-12-03"
  s.description = "A simple, ORM agnostic, Ruby 1.9 compatible PESEL (polish personal id number) validator and personal data extractor for Rails 3, based on ActiveModel."
  s.email = ["wpasternak@gmail.com"]
  s.homepage = "http://github.com/voytee/activepesel"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "A simple, ORM agnostic, Ruby 1.9 compatible PESEL validator and personal data extractor for Rails 3, based on ActiveModel."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
