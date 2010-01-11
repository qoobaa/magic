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
    def guess_file_mime(filename, *args)
      guess(*args.unshift(:mime)) { |db| db.file(filename) }
    end

    # Guesses mime encoding of given file
    # ===== Example
    #   Magic.guess_file_mime_encoding("public/images/rails.png")
    #   # => "binary"
    def guess_file_mime_encoding(filename, *args)
      guess(*args.unshift(:mime_encoding)) { |db| db.file(filename) }
    end

    # Guesses mime type of given file
    # ===== Example
    #   Magic.guess_file_mime_type("public/images/rails.png")
    #   # => "image/png"
    def guess_file_mime_type(filename, *args)
      guess(*args.unshift(:mime_type)) { |db| db.file(filename) }
    end

    # Guesses mime type of given string
    # ===== Example
    #   Magic.guess_string_mime("Magic® File™")
    #   # => "text/plain; charset=utf-8"
    def guess_string_mime(string, *args)
      guess(*args.unshift(:mime)) { |db| db.buffer(string) }
    end

    # Guesses mime type of given string
    # ===== Example
    #   Magic.guess_string_mime_encoding("Magic® File™")
    #   # => "utf-8"
    def guess_string_mime_encoding(string, *args)
      guess(*args.unshift(:mime_type)) { |db| db.buffer(string) }
    end

    # Guesses mime type of given string
    # ===== Example
    #   Magic.guess_string_mime_type("Magic® File™")
    #   # => "text/plain"
    def guess_string_mime_type(string, *args)
      guess(*args.unshift(:mime_type)) { |db| db.buffer(string) }
    end

    # Creates magic database and yields it to the given block
    # ===== Example
    #   Magic.guess(:mime) { |db| db.buffer("Magic® File™") }
    #   # => "text/plain; charset=utf-8"
    def guess(*args)
      db = Database.new(*args)
      yield(db).tap do
        db.close
      end
    end
  end
end
