class GamesController < ApplicationController

	def show

	end

	def boxscore
		@games = $msf.msf_get_data(params[:league], params[:season], 'game_boxscore', 'json', 'gameid' => params[:gameid])['gameboxscore']
		@pics = Picture.where(game_id: params[:gameid])
	end
end
