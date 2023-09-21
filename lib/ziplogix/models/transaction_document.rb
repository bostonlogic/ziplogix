module Ziplogix
  class TransactionDocument < BaseModel
    attribute :id
    attribute :document_name
    attribute :description
    attribute :conetnt_type
    attribute :version
    attribute :signed
  end
end
