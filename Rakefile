require 'rake'
require 'spec/rake/spectask'

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
