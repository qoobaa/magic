module Magic
  class Database
    # Creates an instance of +Magic::Database+ using given database
    # file and flags
    def initialize(database_filename = nil, *flags)
      open(*flags)
      load(database_filename)
    end

    # Opens magic db using given flags
    def open(*flags)
      magic_flags = flags.inject(0) { |acc, flag| acc |= Constants::Flag.const_get(flag.to_s.upcase) }
      @magic_set = Api.magic_open(magic_flags)
    end

    # Closes the database
    def close
      Api.magic_close(@magic_set)
    end

    # Loads given database file (or default if +nil+ given)
    def load(database_filename = nil)
      Api.magic_load(@magic_set, database_filename)
    end

    # Determine type of a file at given path
    def file(filename)
      result = Api.magic_file(@magic_set, filename.to_s)
      if result.null?
        raise Exception, error
      else
        result.get_string(0)
      end
    end

    # Determine type of given string
    def buffer(string)
      result = Api.magic_buffer(@magic_set, string, string.bytesize)
      if result.null?
        raise Exception, error
      else
        result.get_string(0)
      end
    end

    # Returns last error occured
    def error
      Api.magic_error(@magic_set)
    end
  end
end
