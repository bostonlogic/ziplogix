module ErrorHandlingResourcable
  def self.included(base)
    base.send(:resources) do
      default_handler do |response|
        case response.status
        when 200...299
          next
        when 304
          raise Ziplogix::NotModifiedError.new("#{response.status}: #{response.body}")
        when 400
          raise Ziplogix::BadRequestError.new("#{response.status}: #{response.body}")
        when 401
          raise Ziplogix::UnauthorizedError.new("#{response.status}: #{response.body}")
        when 403
          if response.body.match(/forbidden/i)
            raise Ziplogix::ForbiddenError.new("#{response.status}: #{response.body}")
          else
            raise Ziplogix::BlankPDFNotAllowedError.new("#{response.status}: #{response.body}")
          end
        when 404
          raise Ziplogix::NotFoundError.new("#{response.status}: #{response.body}")
        when 409
          raise Ziplogix::AccountLinkingFailedError.new("#{response.status}: #{response.body}")
        when 415
          raise Ziplogix::UnsupportedMediaError.new("#{response.status}: #{response.body}")
        when 500
          raise Ziplogix::InternalServerError.new("#{response.status}: #{response.body}")
        when 503
          raise Ziplogix::ServiceUnavailableError.new("#{response.status}: #{response.body}")
        else
          raise Ziplogix::Error.new("#{response.status}: #{response.body}")
        end
      end
    end
  end
end
