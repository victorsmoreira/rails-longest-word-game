class GamesController < ApplicationController
  def new
    alphabet = ('A'..'Z').to_a
    @letters = (0...10).map { alphabet[rand(alphabet.size)] }
  end

  def score
    attempt = params[:attempt].upcase
    letters = params[:letters].upcase
    base_url = 'https://wagon-dictionary.herokuapp.com/'
    @on_grid = attempt.chars.map { |char| (letters.include? char) && attempt.count(char) <= letters.count(char) }.all?
    @exists = JSON.parse(URI.parse("#{base_url}#{attempt}").open.read)['found']
  end
end
