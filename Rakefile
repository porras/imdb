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

namespace :gem do
  desc "Increments the Gem version in imdb.gemspec"
  task :increment do
    lines = File.new('imdb.gemspec').readlines
    lines.each do |line|
      next unless line =~ /version = '\d+\.\d+\.(\d+)'/
      line.gsub!(/\d+'/, "#{$1.to_i + 1}'")
    end
    File.open('imdb.gemspec', 'w') do |f|
      lines.each do |line|
        f.write(line)
      end
    end
  end
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

