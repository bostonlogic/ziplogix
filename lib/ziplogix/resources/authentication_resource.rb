module Ziplogix
  class AuthenticationResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # POST /auth/user
      action :create do
        verb :post
        body { |object| AuthenticationMapping.representation_for(:create, object) }
        path 'api/auth/user'
        handler(200) { |response| AuthenticationMapping.extract_single(response.body, :read) }
      end

      # POST auth/external-id
      action :find do
        verb :post
        body { |object| AuthenticationMapping.representation_for(:find, object) }
        path 'api/auth/external-id'
        handler(200) { |response| AuthenticationMapping.extract_single(response.body, :read) }
      end

      # POST auth/end-session
      action :destroy do
        verb :post
        path 'api/auth/end-session'
        handler(204) { |_| true }
      end

      # POST auth/unlink
      # action :unlink do
      #   verb :post
      #   body { |object| AuthenticationMapping.representation_for(:destroy, object) }
      #   path 'api/auth/unlink'
      #   handler(200) { |response| AuthenticationMapping.extract_single(response.body, :read) }
      # end

    end

  end
end
