# Sorcery::Yandex

This Gem adds oauth2 yandex.ru provider to `sorcery` gem.
You need to registrate your application in Yandex: https://oauth.yandex.ru/client/new

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sorcery' # you should have it
gem 'sorcery-yandex', git: "https://github.com/teachbase/sorcery-yandex"
```

And then execute:

    $ bundle install

## Usage

In you `initializers/sorcery.rb` file:

```ruby
# add :yandex provider
config.external_providers = [ ..., :yandex]
config.yandex.key = 'your_app_id'
config.yandex.secret = 'your_secret_key'
config.yandex.user_info_mapping = { email: "email", name: "first_name", last_name: 'last_name' }

# your callback URL
config.yandex.callback_url = "http://example.com/oauth/callback?provider=yandex"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sorcery-yandex/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
