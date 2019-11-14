require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

get "/" do
  redirect "/users"
end

get "/users" do
  @content = YAML.load_file('users.yaml')
  erb :users
end
