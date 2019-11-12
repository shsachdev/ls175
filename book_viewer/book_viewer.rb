require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.readlines("data/toc.txt")
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map do |paragraph|
      "<p>#{paragraph}</p>"
    end.join
  end
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  @num = params[:number].to_i
  chapter_name = @contents[@num - 1]
  @title = "Chapter #{@num}: #{chapter_name}"
  @chapter = File.read("data/chp#{@num}.txt")

  erb :chapter
end

# in_paragraphs method

# method takes a string that is the chapter content and return the same string
# with paragraph tags wrapped around each non-empty line.
