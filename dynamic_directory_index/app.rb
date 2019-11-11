require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @list_of_files = Dir.glob("public/*")
  erb :main_listing
end

get "/sort/ascending" do
  @list_of_files = Dir.glob("public/*")
  erb :main_listing
end

get "/sort/descending" do
  @list_of_files = Dir.glob("public/*").sort {|a,b| b <=> a}
  erb :main_listing
end

def file_cleaner(file)
  file.split("/")[1]
end
