# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'magic/version'

Gem::Specification.new do |spec|
  spec.name          = "magic"
  spec.version       = Magic::VERSION
  spec.authors       = ["Kuba Kuźma"]
  spec.email         = ["kuba@jah.pl"]
  spec.summary       = %q{Determine file type and encoding using "magic" numbers}
  spec.description   = %q{Ruby FFI bindings to libmagic}
  spec.homepage      = "https://github.com/qoobaa/magic"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ffi", [">= 0.6.3"]
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit", [">= 2.0"]

  spec.post_install_message = <<-EOM
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
