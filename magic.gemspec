# -*- coding: utf-8 -*-

lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "magic/version"

Gem::Specification.new do |s|
  s.name = "magic"
  s.version = Magic::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Jakub Kuźma"]
  s.email = "qoobaa@gmail.com"
  s.homepage = "http://jah.pl/projects/magic.html"
  s.summary = 'Determine file type and encoding using "magic" numbers'
  s.description = "Ruby FFI bindings to libmagic"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_runtime_dependency "ffi", [">= 0.6.3"]
  s.add_development_dependency "test-unit", [">= 2.0"]

  s.files = Dir.glob("lib/**/*") + %w(LICENSE README.rdoc)

  s.post_install_message = <<-EOM
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
| You'll also need to set your PATH environment variable to the     |
| directory of the magic1.dll file                                  |
|                                                                   |
|   set PATH=C:\\Program Files\\GnuWin32\\bin;%PATH%                   |
|                                                                   |
+-NOTE FOR MAC OS USERS --------------------------------------------+
|                                                                   |
| If you don't have libmagic.1.dylib file in your system, you need  |
| to install it using port command                                  |
|                                                                   |
|   sudo port install file                                          |
|                                                                   |
+-------------------------------------------------------------------+
  EOM
end
