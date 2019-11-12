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
  @num = params[:number].to_i
  @contents = File.readlines("data/toc.txt")
  chapter_name = @contents[@num - 1]
  @title = "Chapter #{@num}: #{chapter_name}"
  @chapter = File.read("data/chp#{@num}.txt")

  erb :chapter
end
