require 'test_helper'

class Ziplogix::AuthenticationResourceTest < Minitest::Test

  class Create < Minitest::Test

    def test_success_on_create
      stub_request(:post, 'https://h5.zipformonline.com/api/auth/user').
        to_return(body: api_fixture('authentication/success'))

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::AuthenticationResource.new(connection: connection)
      authentication_object = Ziplogix::Authentication.new(
        shared_key: 'akili-ni-mali',
        external_id: 'dunia-ina-mambo',
        username: 'albus',
        password: 'sherbertlemon'
      )
      
      authentication = resource.create(authentication_object)

      assert_instance_of Ziplogix::Authentication, authentication
      assert_equal 'mtoto-akililia-wember-mpe', authentication.context_id
      assert_equal '1234', authentication.external_id
    end

    def test_failure_on_create
      stub_request(:post, 'https://h5.zipformonline.com/api/auth/user').
        to_return(status: 401)

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::AuthenticationResource.new(connection: connection)
      authentication_object = Ziplogix::Authentication.new(
        shared_key: 'akili-ni-mali',
        external_id: 'dunia-ina-mambo',
        username: 'albus',
        password: 'sherbertlemon'
      )
      
      assert_raises(Ziplogix::UnauthorizedError) { resource.create(authentication_object) }
    end

  end

  class Find < Minitest::Test

    def test_success_on_find
      stub_request(:post, 'https://h5.zipformonline.com/api/auth/external-id').
        to_return(body: api_fixture('authentication/success'))

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::AuthenticationResource.new(connection: connection)
      authentication_object = Ziplogix::Authentication.new(
        shared_key: 'akili-ni-mali',
        external_id: 'dunia-ina-mambo'
      )

      authentication = resource.find(authentication_object)

      assert_instance_of Ziplogix::Authentication, authentication
      assert_equal 'mtoto-akililia-wember-mpe', authentication.context_id
      assert_equal '1234', authentication.external_id
    end

    def test_failure_on_find
      stub_request(:post, 'https://h5.zipformonline.com/api/auth/external-id').
        to_return(status: 401)
      authentication_object = Ziplogix::Authentication.new(
        shared_key: 'akili-ni-mali',
        external_id: 'dunia-ina-mambo'
      )

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::AuthenticationResource.new(connection: connection)
      
      assert_raises(Ziplogix::UnauthorizedError) { resource.find(authentication_object) }
    end

  end

  class Destroy < Minitest::Test

    def test_success_on_destroy
      stub_request(:post, 'https://h5.zipformonline.com/api/auth/end-session').
        to_return(status: 204, body: [])

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::AuthenticationResource.new(connection: connection)
      
      authentication = resource.destroy

      assert authentication
    end

    def test_failure_on_destroy
      stub_request(:post, 'https://h5.zipformonline.com/api/auth/end-session').
        to_return(status: 401)

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::AuthenticationResource.new(connection: connection)
      
      assert_raises(Ziplogix::UnauthorizedError) { resource.destroy }
    end

  end

  class Unlink < Minitest::Test
    
    def test_success_on_unlink
      skip('Need to decided whether and what to test here')
    end

    def test_failure_on_unlink
      skip('Need to decided whether and what to test here')
    end

  end

end
