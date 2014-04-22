module Magic
  class Database
    attr_reader :flags

    # Creates an instance of +Magic::Database+ using given database
    # file and flags
    def initialize(*args)
      options = args.last.is_a?(Hash) ? args.pop : {} # extract options
      database = options.delete(:database)
      open(*args)
      load(database)
    end

    # Opens magic db using given flags
    def open(*flags)
      @flags = calculate_flags(*flags)
      @magic_set = Api.magic_open(@flags)
    end

    # Closes the database
    def close
      Api.magic_close(@magic_set)
    end

    # Loads given database file (or default if +nil+ given)
    def load(database = nil)
      Api.magic_load(@magic_set, database)
    end

    # Determine type of a file at given path
    def file(filename)
      if !File.exists?(filename)
        raise Exception, "#{filename}: No such file or directory"
      end
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

    # Returns the last error occured
    def error
      Api.magic_error(@magic_set)
    end

    # Sets the flags
    def flags=(*flags)
      @flags = calculate_flags(*flags)
      Api.magic_setflags(@magic_set, @flags)
    end

    protected

    def calculate_flags(*flags)
      flags.inject(0) { |calculated, flag| calculated |= Constants::Flag.const_get(flag.to_s.upcase) }
    end
  end
end
