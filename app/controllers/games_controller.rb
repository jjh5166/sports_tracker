class GamesController < ApplicationController

	def show

	end

	def season
	  	@games = $msf.msf_get_data('nba', '2016-2017-regular', 'full_game_schedule', 'json')["fullgameschedule"]["gameentry"]
	end

	def scoreboard
		@games = $msf.msf_get_data(params[:league], '2016-2017-regular', 'scoreboard', 'json', 'fordate' => params[:date])['scoreboard']['gameScore']
	end

	def boxscore
		@games = $msf.msf_get_data(params[:league], '2016-2017-regular', 'game_boxscore', 'json', 'gameid' => params[:gameid])
	end
end