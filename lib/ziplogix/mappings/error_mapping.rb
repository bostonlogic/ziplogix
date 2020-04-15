module Ziplogix
  class ErrorMapping
    Error = Struct.new(:message, :message_detail, model_state)

    include Kartograph::DSL

    kartograph do
      mapping Error

      scoped :read do
        property :message,        key: 'Message'
        property :message_detail, key: 'MessageDetail'
        property :model_state,    key: 'ModelState'
      end
    end

    def self.fail_with(klass, content)
      error = extract_single(content, :read)
      raise klass, "Code: #{error.code}, Source: #{error.source}, Detail: #{error.detail}"
    end
  end
end
