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
  erb :users, layout: :layout
end

get "/users/:name" do
  @name = params[:name]
  hash = @content[@name.to_sym] # => {:email=>"jamy.rustenburg@gmail.com", :interests=>["woodworking", "cooking", "reading"]}
  @email = hash[:email] # => returns a string
  @interests = hash[:interests] # => returns an array
  erb :individual_user, layout: :layout
end
