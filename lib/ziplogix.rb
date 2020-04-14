require 'ziplogix/version'
require 'ziplogix/property_information'
require 'ziplogix/configuration'
require 'resource_kit'
require 'kartograph'

module Ziplogix

  autoload :Client, 'ziplogix/client'

  autoload :AuthenticationMapping, 'ziplogix/mappings/authentication_mapping'
  autoload :ErrorMapping, 'ziplogix/mappings/error_mapping'
  autoload :TransactionMapping, 'ziplogix/mappings/transaction_mapping'
  autoload :TransactionDataMapping, 'ziplogix/mappings/transaction_data_mapping'

  autoload :BaseModel, 'ziplogix/models/base_model'
  autoload :Authentication, 'ziplogix/models/authentication'
  autoload :Transaction, 'ziplogix/models/transaction'
  autoload :TransactionData, 'ziplogix/models/transaction_data'

  autoload :AuthenticationResource, 'ziplogix/resources/authentication_resource'
  autoload :ErrorHandlingResourcable, 'ziplogix/error_handling_resourcable'
  autoload :TransactionResource, 'ziplogix/resources/transaction_resource'
  autoload :TransactionDataResource, 'ziplogix/resources/transaction_data_resource'

  class Error < StandardError; end
  class NotModifiedError < Ziplogix::Error; end
  class BadRequestError < Ziplogix::Error; end
  class UnauthorizedError < Ziplogix::Error; end
  class ForbiddenError < Ziplogix::Error; end
  class BlankPDFNotAllowedError < Ziplogix::Error; end
  class NotFoundError < Ziplogix::Error; end
  class AccountLinkingFailedError < Ziplogix::Error; end
  class UnsupportedMediaError < Ziplogix::Error; end
  class InternalServerError < Ziplogix::Error; end
  class ServiceUnavailableError < Ziplogix::Error; end

end
