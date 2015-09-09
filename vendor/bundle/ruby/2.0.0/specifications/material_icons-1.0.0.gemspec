# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "material_icons"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Angel M Miguel"]
  s.date = "2015-06-12"
  s.description = "Add Google Material Icons in your Rails projects easily. It is a library with +750 icons ;)"
  s.email = "angel@laux.es"
  s.homepage = "https://laux.es"
  s.licenses = ["MIT", "Creative Common Attribution 4.0 International License"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "A simple Rails wrapper for Google Material Icons"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, [">= 4.2.0", "~> 4.2"])
      s.add_development_dependency(%q<sqlite3>, [">= 1.3"])
      s.add_development_dependency(%q<rspec>, [">= 3.2"])
      s.add_development_dependency(%q<rspec-rails>, [">= 3.2"])
      s.add_development_dependency(%q<capybara>, [">= 2.4.4"])
    else
      s.add_dependency(%q<rails>, [">= 4.2.0", "~> 4.2"])
      s.add_dependency(%q<sqlite3>, [">= 1.3"])
      s.add_dependency(%q<rspec>, [">= 3.2"])
      s.add_dependency(%q<rspec-rails>, [">= 3.2"])
      s.add_dependency(%q<capybara>, [">= 2.4.4"])
    end
  else
    s.add_dependency(%q<rails>, [">= 4.2.0", "~> 4.2"])
    s.add_dependency(%q<sqlite3>, [">= 1.3"])
    s.add_dependency(%q<rspec>, [">= 3.2"])
    s.add_dependency(%q<rspec-rails>, [">= 3.2"])
    s.add_dependency(%q<capybara>, [">= 2.4.4"])
  end
end
