require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  redirect "/users"
end

get "/users" do
  @content = File.
  erb :users
end
