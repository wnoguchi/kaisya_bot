#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)

require 'twitter'
require 'time_messenger'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'xxxxx'
  config.consumer_secret = 'xxxxx'
  config.access_token = 'xxxxx'
  config.access_token_secret = 'xxxxx'
end

now = Time.now
message = TimeMessenger.get_message(now.year, now.month, now.mday, now.wday, now.hour)

begin
  puts message
  if message
    client.update("#{message} #kaisya_bot")
  end
rescue => e
  p e
end

