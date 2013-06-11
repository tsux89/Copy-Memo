require "rubygems"
gem 'twitter'
require "twitter"
gem "tweetstream"
require "tweetstream"
 


CONSUMER_KEY = 'IQKbtAYlXLripLGPWd0HUA'
CONSUMER_SECRET = 'GgDYlkSvaPxGxC4X8liwpUoqKwwr3lCADbz8A7ADU'

OAUTH_TOKEN = ''
OAUTH_TOKEN_SECRET = ''


# Twitter gemでのアカウントの認証。
$twitter = Twitter::Client.new(
  :consumer_key       => CONSUMER_KEY,
  :consumer_secret    => CONSUMER_SECRET,
  :oauth_token        => OAUTH_TOKEN,
  :oauth_token_secret => OAUTH_TOKEN_SECRET
)


# TweetStream gemでのアカウントの認証。



TweetStream.configure do |config|
      	config.consumer_key       = CONSUMER_KEY
      	config.consumer_secret    = CONSUMER_SECRET
      	config.oauth_token        = OAUTH_TOKEN
      	config.oauth_token_secret = OAUTH_TOKEN_SECRET
      	config.auth_method        = :oauth
end

# $twitter.list_create("confirm-blocked") 非公開リストを作りたいけどoptionがわからないマン

client = TweetStream::Client.new

client.userstream do |status|

	puts status.user.screen_name

	$twitter.list_add_menber("#{status.user.screen_name}")
