require "ffi"

require "magic/errors"
require "magic/library"
require "magic/api"
require "magic/constants"
require "magic/database"

module Magic
  class << self
    def guess_file_mime(file)
      guess(:file, :mime, file)
    end

    def guess_file_mime_encoding(file)
      guess(:file, :mime_encoding, file)
    end

    def guess_file_mime_type(file)
      guess(:file, :mime_type, file)
    end

    def guess_string_mime(string)
      guess(:buffer, :mime, string)
    end

    def guess_string_mime_encoding(string)
      guess(:buffer, :mime_encoding, string)
    end

    def guess_string_mime_type(string)
      guess(:buffer, :mime_type, string)
    end

    protected

    def guess(type, what, where)
      db = Database.new(what)
      result = db.send(type, where)
      db.close
      result
    end
  end
end
