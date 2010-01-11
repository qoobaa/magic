module Magic
  class Library
    def initialize
      name or raise UnsupportedPlatform, "platform #{platform} is unsupported"
    end

    def platform
      RUBY_PLATFORM.downcase
    end

    def name
      case platform
      when /darwin/
        "libmagic.1.dylib"
      when /linux|freebsd|netbsd|openbsd|dragonfly|solaris/
        "libmagic.so.1"
      when /win|mingw/
        "magic1.dll"
      end
    end
  end
end
