module Ziplogix
  class TransactionDocument < BaseModel
    attribute :id
    attribute :name
    attribute :description
    attribute :conetnt_type
    attribute :version
    attribute :signed
  end
end
