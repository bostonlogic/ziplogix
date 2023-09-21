module Ziplogix
  class TransactionDocument < BaseModel
    attribute :id
    attribute :document_name
    attribute :description
    attribute :content_type
    attribute :version
    attribute :signed
  end
end
