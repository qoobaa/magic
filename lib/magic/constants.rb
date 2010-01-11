module Magic
  module Constants #:nodoc:
    module Flag
      # No flags
      NONE              = 0x000000
      # Turn on debugging
      DEBUG             = 0x000001
      # Follow symlinks
      SYMLINK           = 0x000002
      # Check inside compressed files
      COMPRESS          = 0x000004
      # Look at the contents of devices
      DEVICES           = 0x000008
      # Return the MIME type
      MIME_TYPE         = 0x000010
      # Return all matches
      CONTINUE          = 0x000020
      # Print warnings to stderr
      CHECK             = 0x000040
      # Restore access time on exit
      PRESERVE_ATIME    = 0x000080
      # Don't translate unprintable chars
      RAW               = 0x000100
      # Handle ENOENT etc as real errors
      ERROR             = 0x000200
      # Return the MIME encoding
      MIME_ENCODING     = 0x000400
      # Return the MIME "type; charset=encoding"
      MIME              = (MIME_TYPE | MIME_ENCODING)
      # Return the Apple creator and type
      APPLE             = 0x000800
      # Don't check for compressed files
      NO_CHECK_COMPRESS = 0x001000
      # Don't check for tar files
      NO_CHECK_TAR      = 0x002000
      # Don't check magic entries
      NO_CHECK_SOFT     = 0x004000
      # Don't check application type
      NO_CHECK_APPTYPE  = 0x008000
      # Don't check for elf details
      NO_CHECK_ELF      = 0x010000
      # Don't check for text files
      NO_CHECK_TEXT     = 0x020000
      # Don't check for cdf files
      NO_CHECK_CDF      = 0x040000
      # Don't check tokens
      NO_CHECK_TOKENS   = 0x100000
      # Don't check text encodings
      NO_CHECK_ENCODING = 0x200000
    end
  end
end
