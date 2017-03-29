# OmniAuth Working Not Working

This strategy provides OAuth access to Working Not Working.

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-workingnotworking'
```

If you need to use the latest HEAD version, you can do so with:

```ruby
gem 'omniauth-workingnotworking', :github => 'workingnotworking/omniauth-workingnotworking'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :workingnotworking, "APP_ID", "SECRET"
end
```
