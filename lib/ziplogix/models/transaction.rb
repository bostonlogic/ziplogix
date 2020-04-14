module Ziplogix
  class Transaction < BaseModel
    attribute :id

    attribute :name
    attribute :transaction_type
    attribute :property_type
    attribute :status
    attribute :data, TransactionData

    attribute :expiration
    attribute :has_files
    attribute :is_signed
    attribute :created
    attribute :last_updated
    attribute :seller
    attribute :buyer
    attribute :property_address
    attribute :address
    attribute :city
    attribute :state
    attribute :zip
    attribute :number
    attribute :owner_name
    attribute :owner_id
  end
end
