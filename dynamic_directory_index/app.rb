require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @list_of_files = Dir.glob("*")
  erb :main_listing
end
