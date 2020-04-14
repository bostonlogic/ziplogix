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


# {
#     "Message": "The request is invalid.",
#     "ModelState": {
#         "newTransaction.transactionType": [
#             "Error converting value \"Lease-Listing\" to type 'System.Nullable`1[ZFramework.ZipformObjects.TransactionType]'. Path 'transactionType', line 4, position 36."
#         ],
#         "newTransaction.data.REData_REProperties_ResidentialProperty_Listing_ListingID": [
#             "After parsing a value an unexpected character was encountered: \". Path 'data.REData_REProperties_ResidentialProperty_Listing_ListingID', line 17, position 4.",
#             "After parsing a value an unexpected character was encountered: \". Path 'data.REData_REProperties_ResidentialProperty_Listing_ListingID', line 17, position 4."
#         ]
#     }
# }

