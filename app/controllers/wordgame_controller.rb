require 'longest_game.rb'

class WordgameController < ApplicationController
  def game
  	@game_grid = LongestGame.generate_grid(15)
  end

  def score
  	puts params[:guess]
  	puts params[:game_grid]
   	puts LongestGame.word_in_grid?(params[:guess], params[:game_grid])
  end
end
