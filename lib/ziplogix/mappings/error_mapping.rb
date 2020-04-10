module Ziplogix
  class ErrorMapping
    Error = Struct.new(:message, :id)

    include Kartograph::DSL

    kartograph do
      mapping Error

      scoped :read do
        property :message, key: 'Message'
      end
    end

    def self.fail_with(klass, content)
      error = extract_single(content, :read)
      raise klass, "Code: #{error.code}, Source: #{error.source}, Detail: #{error.detail}"
    end
  end
end


# {
#     "Message": "Authorization has been denied for this request."
# }

# {
#     "Message": "The requested resource does not support http method 'POST'."
# }


# {
#     "Message": "No HTTP resource was found that matches the request URI 'https://h5.zipformonline.com/api/auth/unlink'.",
#     "MessageDetail": "No action was found on the controller 'Authenticate' that matches the request."
# }
