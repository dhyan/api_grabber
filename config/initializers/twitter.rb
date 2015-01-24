
#Enter the keys..Sign-up and fins it from aps.twitter.com
$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "XXXXXXXXXXXXXXXXXXX"
  config.consumer_secret     = "XXXXXXXXXXXXXXXXXXX"
  config.access_token        = "XXXXXXXXXXXXXXXXXXX"
  config.access_token_secret = "XXXXXXXXXXXXXXXXXXX"
end