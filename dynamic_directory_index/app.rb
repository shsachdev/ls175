require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @list_of_files = Dir.glob("public/*").sort
  @list_of_files.reverse! if params[:sort] == "desc"
  erb :main_listing
end

def file_cleaner(file)
  file.split("/")[1]
end
