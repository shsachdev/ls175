require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @contents = File.readlines("data/toc.txt")

  erb :home
end

# get "/chapters/1" do
#   @title = "Chapter 1"
#   @contents = File.readlines("data/toc.txt")
#   @chapter = File.read("data/chp1.txt")
#
#   erb :chapter
# end

get "/show/:name" do
  params[:name] # params hash is automatically made available in routes
end

get "/chapters/:number" do
  @title = "Chapter #{params[:number]}"
  @contents = File.readlines("data/toc.txt")
  @chapter = File.read("data/chp#{params[:number]}.txt")
end
