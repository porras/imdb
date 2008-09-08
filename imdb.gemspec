Gem::Specification.new do |s|
  s.name = 'imdb'
  s.version = '0.0.1'
  s.summary = 'Internet Movie DataBase'
  s.authors = [ 'Sergio Gil' ]
  s.email = 'sgilperez@gmail.com'
  s.files = [
    "lib/imdb/imdb_movie.rb",
    "lib/imdb/imdb_search.rb",
    "lib/imdb.rb",
    "lib/string_extensions.rb",
    "Rakefile",
    "README"    
  ]
  s.test_files = [
    "spec/imdb_movie_spec.rb",
    "spec/imdb_search_spec.rb",
    "spec/samples/sample_incomplete_movie.html",
    "spec/samples/sample_movie.html",
    "spec/samples/sample_search.html",
    "spec/spec_helper.rb",
    "spec/string_extensions_spec.rb",
    "spec.html"
  ]
end

