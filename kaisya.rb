#!/usr/bin/env ruby

require 'rubygems'
require 'twitter'
require 'time_messenger'

Twitter.configure do |config|
  config.consumer_key = 'xxxxx'
  config.consumer_secret = 'xxxxx'
  config.oauth_token = 'xxxxx'
  config.oauth_token_secret = 'xxxxx'
end

now = Time.now
message = TimeMessenger.get_message(now.year, now.month, now.mday, now.wday, now.hour)

begin
  puts message
  if message
    client = Twitter::Client.new
    client.update("#{message} #kaisya_bot")
  end
rescue => e
  p e
end
