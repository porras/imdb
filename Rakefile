require 'rake'
require 'spec/rake/spectask'

desc "Run all specs"
task :default => :spec

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
end

desc "Run all specs and generate HTML report"
Spec::Rake::SpecTask.new('spec:html') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.spec_opts = ["--format", "html:spec.html"]
end

desc "Run all specs and dump the result to README"
Spec::Rake::SpecTask.new('spec:readme') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.spec_opts = ["--format", "specdoc:README"]
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = 'imdb'
    s.summary = 'Internet Movie DataBase'
    s.authors = [ 'Sergio Gil' ]
    s.email = 'sgilperez@gmail.com'
    s.add_dependency('hpricot', '>= 0.6')
    s.add_dependency('chronic')
    s.files = [
      "lib/imdb/imdb_movie.rb",
      "lib/imdb/imdb_search.rb",
      "lib/imdb.rb",
      "lib/string_extensions.rb",
      "README"    
    ]
  end
rescue
end

namespace :spec do
  desc "Update page samples"
  task :update_samples do
    require 'open-uri'
    {
      "sample_movie" => "http://www.imdb.com/title/tt0097576/",
      "sample_search" => "http://www.imdb.com/find?q=indiana+jones",
      "sample_incomplete_movie" => "http://www.imdb.com/title/tt0054961/",
      "sample_spanish_search" => "http://www.imdb.com/find?q=torrente"
    }.each do |file_name, url|
      File.open(File.join(File.dirname(__FILE__), 'spec', 'samples', file_name + '.html'), 'w') do |f|
        f.write open(url).read
      end
    end
  end
end

