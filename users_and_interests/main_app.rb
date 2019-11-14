require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @content = YAML.load_file('users.yaml')
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/users/:name" do
  @name = params[:name]
  @content[:@name]
  @title =
  erb :individual_user
end
