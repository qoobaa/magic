module Magic
  # General Exception class
  class Error < StandardError
  end

  # for backwards compatibility
  Exception = Error
end
