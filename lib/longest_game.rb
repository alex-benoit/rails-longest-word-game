require 'open-uri'
require 'json'

class LongestGame
  def self.generate_grid(grid_size)
	  grid = []
	  1.upto(grid_size) { grid << ("A".."Z").to_a.sample }
	  return grid
	end

	def self.word_in_grid?(attempt, grid)
		puts "test"
		puts attempt
		puts grid
		puts "test"
	  grid_stripped = grid.dup
	  attempt.split("").all? do |letter|
	    grid_stripped.include? letter
	    grid_stripped.delete(letter)
	  end
	end

	def self.word?(word)
	  url = "http://api.wordreference.com/0.8/80143/json/enfr/#{word}"
	  word_json = JSON.parse(open(url).read)
	  word_json["Error"] == "NoTranslation" ? false : true
	end

	def self.time_taken(start_time, end_time)
	  end_time - start_time
	end

	def self.compute_score(time_taken, attempt)
	  word?(attempt) ? ((attempt.length * 1000) * (1 / (time_taken * 1000))) : 0
	end

	# def self.run_game(attempt, grid, start_time, end_time)
	#   # TODO: runs the game and return detailed hash of result
	#   result = {}
	#   result[:time] = time_taken(start_time, end_time)
	#   result[:translation] = translate_word(attempt)
	#   result[:score] = (word_in_grid?(attempt.upcase, grid) ? compute_score(result[:time], attempt) : 0)
	#   result[:message] = "well done" # default msg
	#   result[:message] = "not an english word" unless word?(attempt)
	#   result[:message] = "not in the grid" unless word_in_grid?(attempt.upcase, grid)
	#   return result
	# end
end