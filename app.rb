require "bundler/setup"
require 'twitter'
require 'pry'
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "MoUVWybJPWTR94gPIGgI21mfo"
  config.consumer_secret     = "NdpPVsv4yHXSkSADY496XYOvnw7Zp64sqR1oVHLQc0g70q2ye3"
  config.access_token        = "1947890120-y6zKs5RDWLcwgXsUZgoPsldE2pCP0HF4TWLtUJK"
  config.access_token_secret = "81CTF9SAj7ILPdn4Eh3prT58ka0DiXeEzkF44t6noNU7v"
end

get "/" do
  @tweets = Tweet.all
  # binding.pry
  erb :index
end

post '/tweets' do
  @count = params['count'].to_i
  @user = params['user']
  @tweets = client.user_timeline(@user, count: @count)
  @tweets.each {|tweet| puts tweet.full_text }
  redirect '/'
end




# use pry: ls Twitter::Tweet to see methods