# encoding: utf-8

require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "magic"
    gem.summary = %Q{Determine file type and encoding using "magic" numbers}
    gem.description = %Q{Ruby FFI bindings to libmagic}
    gem.email = "qoobaa@gmail.com"
    gem.homepage = "http://github.com/qoobaa/magic"
    gem.authors = ["Jakub Kuźma"]
    gem.add_dependency "ffi", ">= 0.5.1"
    gem.add_development_dependency "test-unit", ">= 2.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
    gem.post_install_message = <<-EOM
+-NOTE FOR LINUX USERS----------------------------------------------+
|                                                                   |
| Install libmagic using your package manager, e.g.                 |
|                                                                   |
|   sudo apt-get install file                                       |
|                                                                   |
+-NOTE FOR WINDOWS USERS -------------------------------------------+
|                                                                   |
| Install File for Windows from                                     |
|                                                                   |
|   http://gnuwin32.sourceforge.net/packages/file.htm               |
|                                                                   |
+-NOTE FOR MAC OS USERS --------------------------------------------+
|                                                                   |
| If you don't have libmagic.1.dylib file in your system            |
|                                                                   |
|   find / -name libmagic.1.dylib                                   |
|                                                                   |
| You need to install it via port command                           |
|                                                                   |
|   sudo port install file                                          |
|                                                                   |
| Sometimes you'll also need to set your DYLD_FALLBACK_LIBRARY_PATH |
| environment variable to the directory of the libmagic.1.dylib     |
|                                                                   |
|   export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib                |
|                                                                   |
+-------------------------------------------------------------------+
EOM
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "magic #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
