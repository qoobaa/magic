module Magic
  class Database
    def initialize(*flags)
      open(*flags)
      load
    end

    def open(*flags)
      magic_flags = flags.inject(0) { |acc, flag| acc |= Constants::Flag.const_get(flag.to_s.upcase) }
      @magic_set = Api.magic_open(magic_flags)
    end

    def close
      Api.magic_close(@magic_set)
    end

    def load(database = nil)
      Api.magic_load(@magic_set, database)
    end

    def file(file)
      result = Api.magic_file(@magic_set, file)
      if result.null?
        raise Exception, error
      else
        result.get_string(0)
      end
    end

    def buffer(string)
      result = Api.magic_buffer(@magic_set, string, string.bytesize)
      if result.null?
        raise Exception, error
      else
        result.get_string(0)
      end
    end

    def error
      Api.magic_error(@magic_set)
    end
  end
end
