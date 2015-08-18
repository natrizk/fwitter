require "./config/environment"
require "./app/models/tweet"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end
  
  get "/" do
    @jims_tweet = Tweet.new("Jim", "Hello, I'm a Steelers fan!")
    @dans_tweet = Tweet.new("Dan", "Yo, yo, yo")
    @joes_tweet = Tweet.new("Joes", "I don't like sports")
    @all_tweets = Tweet.all
    puts @all_tweets
    erb :index   
end
  
  post '/new_tweet' do
    puts params
    Tweet.new(params[:username],params[:message])
    @all_tweets = Tweet.all
    erb :index
  end
  
end
