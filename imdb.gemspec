# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{imdb}
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sergio Gil"]
  s.date = %q{2009-05-30}
  s.email = %q{sgilperez@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "README",
     "lib/imdb.rb",
     "lib/imdb/imdb_movie.rb",
     "lib/imdb/imdb_search.rb",
     "lib/string_extensions.rb"
  ]
  s.has_rdoc = true
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Internet Movie DataBase}
  s.test_files = [
    "spec/imdb_movie_spec.rb",
     "spec/imdb_search_spec.rb",
     "spec/spec_helper.rb",
     "spec/string_extensions_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0.6"])
      s.add_runtime_dependency(%q<chronic>, [">= 0"])
    else
      s.add_dependency(%q<hpricot>, [">= 0.6"])
      s.add_dependency(%q<chronic>, [">= 0"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0.6"])
    s.add_dependency(%q<chronic>, [">= 0"])
  end
end
