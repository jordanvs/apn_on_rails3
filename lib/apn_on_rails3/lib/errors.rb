module APN # :nodoc:
  
  module Errors
    
    # Raised when a notification message to Apple is longer than 256 bytes.
    class ExceededMessageSizeError < StandardError
      
      def initialize(message) # :nodoc:
        super("The maximum size allowed for a notification payload is 256 bytes: '#{message}'")
      end
      
    end
    
    class MissingCertificateError < StandardError
      def initialize
        super("This app has no certificate")
      end
    end
    
  end # Errors
  
end # APN
