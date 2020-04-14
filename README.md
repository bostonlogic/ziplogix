# Ziplogix

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ziplogix`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ziplogix'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ziplogix

## Usage

To start off, you should first create an instance of the client, passing in your shared key:

```ruby
client = Ziplogix::Client.new(shared_key: 'your_oauth_access_token')
```

This allow you to fetch a context key via username/password combo

```ruby
client = Ziplogix::Client.new(shared_key: 'your_oauth_access_token', context_id: 'your_context_id')
```
This allow you to interact with all other endpoints


### Authentication

```ruby
authentication = Ziplogix::Authentication.new(username: '', password: '', external_id: '', shared_key: '')
ziplogix_auth = client.authentication.create(authentication) #=>Ziplogix::Authentication
ziplogix_auth.context_id #=> context_id
```

### Transaction

Create a Transaction:

```ruby
transaction_data = Ziplogix::TransactionData.new(property_county: 'Machakos', property_listing_id: 'mtusaba-1234')
transaction = Ziplogix::Transaction.new(name: 'Kitabu Isiyo na Maneno Mengi', transaction_type: 'Listing', property_type: '', data: transaction_data)
transaction = client.transactions.create(transaction) #=>Ziplogix::Transaction
```

Fetch all Transactions:

```ruby
transactions = client.transactions.all #=>[Ziplogix::Transaction, Ziplogix::Transaction, ...]
```

Fetch basic information on a transaction:

```ruby
transaction = client.transactions.info(transaction_id: 'moja-one-two-mbili') #=>Ziplogix::Transaction
```

Fetch detailed information on a transction:

```ruby
transaction = client.transactions.find(transaction_id: 'moja-one-two-mbili') #=>Ziplogix::TransactionData
```

Update information on a transaction:

```ruby
transaction_data = Ziplogix::TransactionData.new(property_county: 'Marsabit')
transaction = client.transactions.update(transaction_id: 'moja-one-two-mbili') #=>Ziplogix::TransactionData
```

Delete information on a transaction:

```ruby
transaction = client.transactions.destroy(transaction_id: 'moja-one-two-mbili') #=>True
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bostonlogic/ziplogix. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ziplogix project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ziplogix/blob/master/CODE_OF_CONDUCT.md).
