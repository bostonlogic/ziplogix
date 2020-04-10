module Ziplogix
  class AuthenticationMapping
    include Kartograph::DSL

    kartograph do
      mapping Authentication

      scoped :create do
        property :shared_key,  key: 'SharedKey'
        property :username,   key: 'UserName'
        property :password,    key: 'Password'
        property :external_id, key: 'LinkExternalId'
      end

      scoped :read do
        property :context_id,  key: 'contextId'
        property :external_id, key: 'externalId'
      end

      scoped :find do
        property :shared_key,  key: 'SharedKey'
        property :external_id, key: 'ExternalId'
      end

    end
  end
end
