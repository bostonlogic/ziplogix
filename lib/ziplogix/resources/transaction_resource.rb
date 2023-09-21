module Ziplogix
  class TransactionResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # POST /transactions
      action :create do
        verb :post
        # body { |object| TransactionMapping.representation_for(:create, object) }
        body do |object|
          proc = Proc.new { |k, v| v.kind_of?(Hash) ? (v.delete_if(&proc); nil) : v.nil? }
          TransactionMapping.hash_for(:create, object).delete_if(&proc).to_json
        end
        path 'api/transactions'
        handler(201) { |response| TransactionMapping.extract_single(response.body, :read) }
      end

      # GET /transactions?[since=<fromDate>&status=<status>&agentId=<otherAgentId>]
      action :all do
        verb :get
        query_keys :since, :modifiedSince, :status, :agentId, :filterBy
        path 'api/transactions'
        handler(200) { |response| TransactionMapping.extract_collection(response.body, :read) }
      end

      # GET transactions/:transaction_id
       action :info do
        verb :get
        path 'api/transactions/:transaction_id'
        handler(200) { |response| TransactionMapping.extract_single(response.body, :info) }
      end

      # GET transactions/:transaction_id/data
      action :find do
        verb :get
        path 'api/transactions/:transaction_id/data'
        handler(200) { |response| TransactionDataMapping.extract_single(response.body, :read) }
      end

      # POST transactions/:transaction_id/data?[mode=Merge|Replace]
      action :update do
        verb :post
        body { |object| TransactionDataMapping.hash_for(:update, object).select{ |_, value| !value.nil? }.to_json }
        path 'api/transactions/:transaction_id/data'
        query_keys :mode
        handler(200) { |_| true }
      end

      # GET transactions/:transaction_id/data
      action :documents do
        verb :get
        path 'api/transactions/:transaction_id/documents?excludeforms=true'
        handler(200) { |response| TransactionDocumentMapping.extract_single(response.body, :read) }
      end

      # DELETE transactions/:transaaction_id
      action :destroy do
        verb :delete
        path 'api/transactions/:transaction_id'
        handler(204) { |_| true }
      end

    end

  end
end
