module Ziplogix
  class TransactionDocumentMapping
    include Kartograph::DSL

    kartograph do
      mapping TransactionDocument

      root_key singular: 'value', plural: 'value', scopes: [:read]

      scoped :read do
        property :id,                            key: 'id'
        property :document_name,                 key: 'name'
        property :description,                   key: 'description'
        property :content_type,                  key: 'contentType'
        property :version,                       key: 'version'
        property :signed,                        key: 'signed'
      end
      
    end

  end
end
