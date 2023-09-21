module Ziplogix
  class TransactionDocumentMapping
    include Kartograph::DSL

    kartograph do
      mapping TransactionDocument

      scoped :read do
        property :id,                            key: 'id'
        property :name,                          key: 'name'
        property :description,                   key: 'description'
        property :content_type,                  key: 'contentType'
        property :version,                       key: 'version'
        property :signed,                        key: 'signed'
      end
      
    end

  end
end
