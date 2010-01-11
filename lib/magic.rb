# encoding: utf-8

require "ffi"

require "magic/errors"
require "magic/api"
require "magic/constants"
require "magic/database"

module Magic
  class << self
    # Guesses mime of given file
    # ====== Example
    #   Magic.guess_file_mime("public/images/rails.png")
    #   # => "image/png; charset=binary"
    def guess_file_mime(filename, options = {})
      guess(options.merge(:method => :file, :target => filename, :flags => [:mime]))
    end

    # Guesses mime encoding of given file
    # ===== Example
    #   Magic.guess_file_mime_encoding("public/images/rails.png")
    #   # => "binary"
    def guess_file_mime_encoding(file, options = {})
      guess(options.merge(:method => :file, :target => filename, :flags => [:mime_encoding]))
    end

    # Guesses mime type of given file
    # ===== Example
    #   Magic.guess_file_mime_type("public/images/rails.png")
    #   # => "image/png"
    def guess_file_mime_type(filename, options = {})
      guess(options.merge(:method => :file, :target => filename, :flags => [:mime_type]))
    end

    # Guesses mime type of given string
    # ===== Example
    #   Magic.guess_string_mime("Magic® File™")
    #   # => "text/plain; charset=utf-8"
    def guess_string_mime(string, options = {})
      guess(options.merge(:method => :buffer, :target => string, :flags => [:mime]))
    end

    # Guesses mime type of given string
    # ===== Example
    #   Magic.guess_string_mime_encoding("Magic® File™")
    #   # => "utf-8"
    def guess_string_mime_encoding(string, options = {})
      guess(options.merge(:method => :buffer, :target => string, :flags => [:mime_encoding]))
    end

    # Guesses mime type of given string
    # ===== Example
    #   Magic.guess_string_mime_type("Magic® File™")
    #   # => "text/plain"
    def guess_string_mime_type(string, options = {})
      guess(options.merge(:method => :buffer, :target => string, :flags => [:mime_type]))
    end

    protected

    def guess(options) #:nodoc:
      flags = options[:flags]
      db_filename = options[:db_filename]
      target = options[:target]
      method = options[:method]

      db = Database.new(database_filename, *flags)
      result = db.send(method, target)
      db.close

      result
    end
  end
end
