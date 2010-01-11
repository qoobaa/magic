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
    def guess_file_mime(file)
      guess(:file, :mime, file)
    end

    # Guesses mime encoding of given file
    # ===== Example
    #   Magic.guess_file_mime("public/images/rails.png")
    #   # => "binary"
    def guess_file_mime_encoding(file)
      guess(:file, :mime_encoding, file)
    end

    # Guesses mime type of given file
    # ===== Example
    #   Magic.guess_file_mime_type("public/images/rails.png")
    #   # => "image/png"
    def guess_file_mime_type(file)
      guess(:file, :mime_type, file)
    end

    # Guesses mime type of given string
    # ===== Example
    #   Magic.guess_string_mime("Magic® File™")
    #   # => "text/plain; charset=utf-8"
    def guess_string_mime(string)
      guess(:buffer, :mime, string)
    end

    # Guesses mime type of given string
    # ===== Example
    #   Magic.guess_string_mime_encoding("Magic® File™")
    #   # => "utf-8"
    def guess_string_mime_encoding(string)
      guess(:buffer, :mime_encoding, string)
    end

    # Guesses mime type of given string
    # ===== Example
    #   Magic.guess_string_mime_type("Magic® File™")
    #   # => "text/plain"
    def guess_string_mime_type(string)
      guess(:buffer, :mime_type, string)
    end

    protected

    def guess(type, what, where) #:nodoc:
      db = Database.new(what)
      result = db.send(type, where)
      db.close
      result
    end
  end
end
