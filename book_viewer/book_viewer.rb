require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @contents = File.readlines("data/toc.txt")

  erb :home
end

get "/show/:name" do
  params[:name] # params hash is automatically made available in routes
end

get "/chapters/:number" do
  @num = params[:number]
  @title = "Chapter #{params[:number]}"
  @contents = File.readlines("data/toc.txt")
  @chapter = File.read("data/chp#{params[:number]}.txt")

  erb :chapter
end
