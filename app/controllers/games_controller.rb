class GamesController < ApplicationController

	def show

	end

	def boxscore
		@games = $msf.msf_get_data(params[:league], params[:season], 'game_boxscore', 'json', 'gameid' => params[:gameid])['gameboxscore']
		@pics = Picture.where(game_id: params[:gameid]).reverse


		@comments = {}

		@pics.first(8).each do |h|
			@comments[h.id] = []
			Comment.where(picture_id: h.id).each do |c|
				@comments[h.id].push(c.content)
			end
		end
	end
end
