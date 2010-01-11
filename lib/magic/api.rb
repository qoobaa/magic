module Magic
  module Api #:nodoc:
    extend FFI::Library

    ffi_lib "libmagic.so.1", "libmagic.1.dylib", "magic1.dll"

    attach_function :magic_open, [:int], :pointer
    attach_function :magic_close, [:pointer], :void
    attach_function :magic_file, [:pointer, :string], :pointer
    # attach_function :magic_descriptor, [:pointer, :int], :string
    attach_function :magic_buffer, [:pointer, :pointer, :uint], :pointer
    attach_function :magic_error, [:pointer], :string
    # attach_function :magic_setflags, [:pointer, :int], :int
    attach_function :magic_load, [:pointer, :string], :int
    # attach_function :magic_compile, [:pointer, :string], :int
    # attach_function :magic_check, [:pointer, :string], :int
    # attach_function :magic_errno, [:pointer], :int
  end
end
