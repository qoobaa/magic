$:.unshift File.expand_path("../lib", __FILE__)

require "rubygems"
require "rubygems/specification"
require "rake/testtask"
require "rdoc/task"
require "rubygems/package_task"
require "magic"

def gemspec
  file = File.expand_path('../magic.gemspec', __FILE__)
  eval(File.read(file), binding, file)
end

Rake::TestTask.new(:test) do |test|
  test.libs << "lib" << "test"
  test.pattern = "test/**/test_*.rb"
  test.verbose = true
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title = "magic #{Magic::VERSION}"
  rdoc.rdoc_files.include("README.rdoc")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

Gem::PackageTask.new(gemspec) do |pkg|
  pkg.gem_spec = gemspec
end

desc "Install the gem locally"
task :install => :package do
  sh %{gem install pkg/#{gemspec.name}-#{gemspec.version}}
end

desc "Validate the gemspec"
task :gemspec do
  gemspec.validate
end

task :gem => :gemspec
task :default => :test
