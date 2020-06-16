require 'test_helper'

class Ziplogix::ClientTest < Minitest::Test

  class Initialize < Minitest::Test

    def test_initialize_requires_an_access_token
      assert_raises(ArgumentError) { Ziplogix::Client.new }
    end

    def test_initialize_creates_a_ziplogix_client_instance
      ziplogix_client = Ziplogix::Client.new(shared_key: 'alohomora')

      assert_instance_of Ziplogix::Client, ziplogix_client
    end

    def test_initialize_sets_the_provided_shared_key
      ziplogix_client = Ziplogix::Client.new(shared_key: 'waddiwasi')

      assert_equal 'waddiwasi', ziplogix_client.shared_key
    end

    def test_initialize_sets_the_provided_shared_key_and_context_id
      ziplogix_client = Ziplogix::Client.new(shared_key: 'alohomora', context_id: 'waddiwasi')

      assert_equal 'alohomora', ziplogix_client.shared_key
      assert_equal 'waddiwasi', ziplogix_client.context_id
    end

  end

  class Connection < Minitest::Test

    def test_connection_sets_the_correct_url
      ziplogix_client = Ziplogix::Client.new(shared_key: 'alohomora')

      assert_equal 'https://h5.zipformonline.com/api', ziplogix_client.connection.url_prefix.to_s
    end

    def test_connection_builds_the_correct_headers_when_only_shared_key_is_present
      ziplogix_client = Ziplogix::Client.new(shared_key: 'alohomora')

      assert_equal 'application/json', ziplogix_client.connection.headers[:content_type]
      assert_nil ziplogix_client.connection.headers['X-Auth-ContextId']
      assert_nil ziplogix_client.connection.headers['X-Auth-SharedKey']
    end

    def test_connection_builds_the_correct_headers_when_shared_key_and_context_id_are_present
      ziplogix_client = Ziplogix::Client.new(shared_key: 'alohomora', context_id: 'waddiwasi')

      assert_equal 'application/json', ziplogix_client.connection.headers[:content_type]
      assert_equal 'waddiwasi', ziplogix_client.connection.headers['X-Auth-ContextId']
      assert_equal 'alohomora', ziplogix_client.connection.headers['X-Auth-SharedKey']
    end

  end

  class MethodMissing < Minitest::Test

    def test_valid_endpoints_succeed
      ziplogix_client = Ziplogix::Client.new(shared_key: 'alohomora')

      assert ziplogix_client.authentication
    end

    def test_invalid_endpoints_raise_method_missing_error
      ziplogix_client = Ziplogix::Client.new(shared_key: 'alohomora')

      assert_raises(NoMethodError) { ziplogix_client.not_a_thing }
    end

  end

end
