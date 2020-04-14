require 'test_helper'

class Ziplogix::TransactionResourceTest < Minitest::Test

  class Create < Minitest::Test

    def test_success_on_create
      stub_request(:post, 'https://h5.zipformonline.com/api/transactions').
        to_return(body: api_fixture('transaction/create'))

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)
      transaction_object = Ziplogix::Transaction.new(
        transaction_type: 'Listing',
        property_type: 'Residential',
        name: 'Terok Nor',
        data: Ziplogix::TransactionData.new(
          seller1_first_name: 'Bajoran',
          seller1_last_name: 'Government',
          property_listing_id: 'DS9',
          property_list_price: 101_000_000_000_000
        )
      )
      
      transaction = resource.create(transaction_object)

      assert_instance_of Ziplogix::Transaction, transaction
      assert_equal '1234-5678-9abc-defg', transaction.id
      assert_equal 'Terok Nor', transaction.name
      assert_equal 'active', transaction.status
      assert_equal '0001-01-01T00:00:00Z', transaction.expiration
      assert_equal 'Listing', transaction.transaction_type
      assert_equal 'Residential', transaction.property_type
      assert_equal false, transaction.has_files
      assert_equal false, transaction.is_signed
      assert_equal '2020-04-06T22:45:17Z', transaction.created
      assert_equal '2020-04-06T22:45:17Z', transaction.last_updated
      assert_equal 'Bajoran Militia', transaction.seller
      assert_equal 'Starfleet', transaction.buyer
      assert_equal '0 Bajoran Wormhole, Bajoran System, Alpha Quadrant', transaction.property_address
      assert_equal '0 Bajoran Wormhole', transaction.address
      assert_equal 'Bajoran System', transaction.city
      assert_equal 'Alpha Quadrant', transaction.state
      assert_equal 'NA-NA-NA', transaction.zip
      assert_equal '12312434', transaction.number
      assert_equal 'Bajoran Government', transaction.owner_name
      assert_equal 'abcdef10234567', transaction.owner_id
    end

    def test_failure_on_create
      stub_request(:post, 'https://h5.zipformonline.com/api/transactions').
        to_return(status: 400)

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)
      transaction_object = Ziplogix::Transaction.new(
        transaction_type: 'Listing',
        property_type: 'Residential',
        data: Ziplogix::TransactionData.new(
          seller1_first_name: 'Bajoran',
          seller1_last_name: 'Government',
          property_listing_id: 'DS9',
          property_list_price: 101_000_000_000_000
        )
      )
      
      assert_raises(Ziplogix::BadRequestError) { resource.create(transaction_object) }
    end

  end

  class All < Minitest::Test

    def test_success_on_all
      stub_request(:get, 'https://h5.zipformonline.com/api/transactions').
        to_return(body: api_fixture('transaction/all'))

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)

      transactions = resource.all

      assert_instance_of Array, transactions
      assert_instance_of Ziplogix::Transaction, transactions.first
      assert_equal 7, transactions.size
      assert_equal ['12-bc', '34-de', '56-fg', '78-hi', '90-jk', 'ab-12', 'cd-34'], transactions.map(&:id)
      assert_equal ['777 E 6th Street, #1 Boston, MA 02127', '160 I Street, #2 Boston, MA 02127', '30 Vinton St, #3 Boston, MA 02127', '420 West Broadway, #202 Boston, MA 02127', '735 Harrison Ave Apt W404', '160 I Street, #3 Boston, MA 02127', '90 M St, #3 Boston, MA 02127'], transactions.map(&:name)
    end

    def test_failure_on_all
      stub_request(:get, 'https://h5.zipformonline.com/api/transactions').
        to_return(status: 503)

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)
      
      assert_raises(Ziplogix::ServiceUnavailableError) { resource.all }
    end

    def test_empty_result_on_all
      stub_request(:get, 'https://h5.zipformonline.com/api/transactions').
        to_return(body: api_fixture('transaction/empty'))

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)

      transactions = resource.all

      assert_instance_of Array, transactions
      assert_nil transactions.first
      assert_equal 0, transactions.size
      assert_equal [], transactions.map(&:id)
      assert_equal [], transactions.map(&:name)
    end

  end

  class Info < Minitest::Test

    def test_success_on_info
      stub_request(:get, 'https://h5.zipformonline.com/api/transactions/1234-5678-9abc-defg').
        to_return(body: api_fixture('transaction/info'))

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)

      transaction = resource.info(transaction_id: '1234-5678-9abc-defg')

      assert_instance_of Ziplogix::Transaction, transaction
      assert_equal '1234-5678-9abc-defg', transaction.id
      assert_equal 'Ancestral Home of the House of Black', transaction.name
      assert_equal 'active', transaction.status
      assert_equal '0001-01-01T00:00:00Z', transaction.expiration
      assert_equal 'Listing', transaction.transaction_type
      assert_equal 'Condominium', transaction.property_type
      assert_equal false, transaction.has_files
      assert_equal false, transaction.is_signed
      assert_equal '2020-03-31T16:48:04Z', transaction.created
      assert_equal '2020-03-31T17:08:31Z', transaction.last_updated
      assert_equal 'Hermione Jean Granger, Ronald Bilius Weasley', transaction.seller
      assert_equal 'Harry James Potter, Ginevra Molly Weasley', transaction.buyer
      assert_equal '12 Grimuld Place, London, England, NA-E72', transaction.property_address
      assert_equal '12 Grimuld Place', transaction.address
      assert_equal 'London', transaction.city
      assert_equal 'England', transaction.state
      assert_equal 'NA-E72', transaction.zip
      assert_equal '235711', transaction.number
      assert_equal 'Sirius Black', transaction.owner_name
      assert_equal 'Siriusblackdos2', transaction.owner_id
    end

    def test_failure_on_find
      stub_request(:get, 'https://h5.zipformonline.com/api/transactions/1234-5678-9abc-defg').
        to_return(status: 404)

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)
      
      assert_raises(Ziplogix::NotFoundError) { resource.info(transaction_id: '1234-5678-9abc-defg') }
    end

  end

  class Find < Minitest::Test

    def test_success_on_find
      stub_request(:get, 'https://h5.zipformonline.com/api/transactions/1234-5678-9abc-defg/data').
        to_return(body: api_fixture('transaction/details'))

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)

      transaction = resource.find(transaction_id: '1234-5678-9abc-defg')

      assert_instance_of Ziplogix::TransactionData, transaction
      assert_equal 'Ancestral Home of the House of Black', transaction.file_name
      assert_equal 'Order of the Phoenix', transaction.broker_name
      assert_equal 'Albus Dumbledore', transaction.user_name
      assert_equal '7135884560', transaction.user_office_phone
      assert_nil transaction.user_fax_number
      assert_equal 'Order of the Phoenix, 12 Grimuld Place, London, England, NA-E72', transaction.user_composite_address

      assert_equal 'Harry', transaction.buyer1_first_name
      assert_equal 'James', transaction.buyer1_middle_name
      assert_equal 'Potter', transaction.buyer1_last_name
      assert_equal 'Harry James Potter', transaction.buyer1_full_name
      assert_equal 'harry.potter@hogwarts.edu', transaction.buyer1_email

      assert_equal 'Ginevra', transaction.buyer2_first_name
      assert_equal 'Molly', transaction.buyer2_middle_name
      assert_equal 'Weasley', transaction.buyer2_last_name
      assert_equal 'Ginevra Molly Weasley', transaction.buyer2_full_name
      assert_equal 'ginny.weasley@hogwarts.edu', transaction.buyer2_email

      assert_equal 'Hermione', transaction.seller1_first_name
      assert_equal 'Jean', transaction.seller1_middle_name
      assert_equal 'Granger', transaction.seller1_last_name
      assert_equal 'Hermione Jean Granger', transaction.seller1_full_name
      assert_equal 'hermione.granger@hogwarts.edu', transaction.seller1_email

      assert_equal 'Ronald', transaction.seller2_first_name
      assert_equal 'Bilius', transaction.seller2_middle_name
      assert_equal 'Weasley', transaction.seller2_last_name
      assert_equal 'Ronald Bilius Weasley', transaction.seller2_full_name
      assert_equal 'ron.weasley@hogwarts.edu', transaction.seller2_email

      assert_equal 'Rarity  ', transaction.list_agent_full_name
      assert_equal 'rarity@ponyville.magic', transaction.list_agent_email
      assert_equal 'Fluttershy  ', transaction.sale_agent_full_name
      assert_equal 'fluttershy@ponyville.magic', transaction.sale_agent_email

      assert_equal '35711', transaction.property_listing_id
      
    end

    def test_failure_on_find
      stub_request(:get, 'https://h5.zipformonline.com/api/transactions/1234-5678-9abc-defg/data').
        to_return(status: 415)

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)
      
      assert_raises(Ziplogix::UnsupportedMediaError) { resource.find(transaction_id: '1234-5678-9abc-defg') }
    end

  end

  class Update < Minitest::Test

    def test_success_on_update
      stub_request(:post, 'https://h5.zipformonline.com/api/transactions/1234-5678-9abc-defg/data?mode=Merge').
        to_return(body: api_fixture('transaction/details'))

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)
      transaction_object = Ziplogix::TransactionData.new(
        file_name: 'Former Ancestral Home of the House of Black',
        broker_name: 'Mundungus Fletcher',
        property_condo_fee: 10,
        property_year_built: 100
      )

      transaction = resource.update(transaction_object, transaction_id: '1234-5678-9abc-defg', mode: 'Merge')

      assert transaction
    end

    def test_failure_on_update
      stub_request(:post, 'https://h5.zipformonline.com/api/transactions/1234-5678-9abc-defg/data?mode=Replace').
        to_return(status: 304)

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)
      transaction_object = Ziplogix::TransactionData.new(
        file_name: nil,
        broker_name: 'Mundungus Fletcher',
        property_condo_fee: 10,
        property_year_built: 100
      )
      
      assert_raises(Ziplogix::NotModifiedError) { resource.update(transaction_object, transaction_id: '1234-5678-9abc-defg', mode: 'Replace') }
    end

  end

  class Destroy < Minitest::Test

    def test_success_on_destroy
      stub_request(:delete, 'https://h5.zipformonline.com/api/transactions/1234-5678-9abc-defg').
        to_return(status: 204, body: [])

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)
      
      transaction = resource.destroy(transaction_id: '1234-5678-9abc-defg')

      assert transaction
    end

    def test_failure_on_destroy
      stub_request(:delete, 'https://h5.zipformonline.com/api/transactions/1234-5678-9abc-defg').
        to_return(status: 405)

      connection = Ziplogix::Client.new(shared_key: 'alohomora').connection
      resource = Ziplogix::TransactionResource.new(connection: connection)
      
      assert_raises(Ziplogix::Error) { resource.destroy(transaction_id: '1234-5678-9abc-defg') }
    end

  end

end
