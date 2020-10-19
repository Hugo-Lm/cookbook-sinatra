require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do   # <-- Router
  @usernames = [ 'ssaunier', 'Papillard' ]
  erb :index  # <-- Controller
end

get '/about' do
  erb :about
end

get '/team/:username' do
  binding.pry
  puts params[:username]
  "The username is #{params[:username]}"
end

get '/layout' do
  erb :layout
end
# Launch Router & Controller : bundle exec ruby app.rb
