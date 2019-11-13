require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.readlines("data/toc.txt")
end

not_found do
  redirect "/"
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map do |paragraph|
      "<p>#{paragraph}</p>"
    end.join
  end

  # def word_cleaner(arr_of_words) # strips each word off bullshit characters
  #   arr_of_words.map do |word|
  #     word.chars
  #   end
  # end
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

get "/search" do
  @search_term = params[:query]
  erb :search
end
