require 'test_helper'

class ZiplogixTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Ziplogix::VERSION
  end

  def test_error_is_defined
    assert Ziplogix::Error
  end

  def test_bad_request_error_is_defined
    assert Ziplogix::BadRequestError
  end

  def test_unauthorized_error_is_defined
    assert Ziplogix::UnauthorizedError
  end

  def test_forbidden_error_is_defined
    assert Ziplogix::ForbiddenError
  end

  def test_not_found_error_is_defined
    assert Ziplogix::NotFoundError
  end

  def test_unprocessable_entity_error_is_defined
    assert Ziplogix::UnsupportedMediaError
  end

  def test_too_many_requests_error_is_defined
    assert Ziplogix::InternalServerError
  end

  def test_service_unavailable_error_is_defined
    assert Ziplogix::ServiceUnavailableError
  end

  def test_blank_pdf_not_allowed_error_is_defined
    assert Ziplogix::BlankPDFNotAllowedError
  end

  def test_account_linking_failed_error_is_defined
    assert Ziplogix::AccountLinkingFailedError
  end

  def test_transaction_types_constant_exists
    refute_nil Ziplogix::TRANSACTIONTYPES
  end

end
