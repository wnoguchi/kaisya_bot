Kaisya Bot
============

[![Build Status](https://travis-ci.org/wnoguchi/kaisya_bot.svg)](https://travis-ci.org/wnoguchi/kaisya_bot)

This program is bot that tweet some messages every hour.  
Default messages customized for Japanese Syachiku.

Usage
-------

Install bundles.

```
bundle install --path vendor/bundle
```

Modify `lib/kaisya.rb` following lines:  
Before You need to create self application, and get OAuth consumer/access tokens.  
More detail, visit [Twitter Application Management](https://apps.twitter.com/).

```ruby
client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'xxxxx'
  config.consumer_secret = 'xxxxx'
  config.access_token = 'xxxxx'
  config.access_token_secret = 'xxxxx'
end
```

For test, Run manually this script like this:

```
bundle exec ruby lib/kaisya.rb
```

License
---------

MIT License

