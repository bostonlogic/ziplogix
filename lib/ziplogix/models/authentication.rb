module Ziplogix
  class Authentication < BaseModel
    attribute :context_id
    attribute :shared_key
    attribute :username
    attribute :password
    attribute :external_id
  end
end
