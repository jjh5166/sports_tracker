class LeaguesController < ApplicationController

  def index
    render :layout => false
  end

  def show

  end

  def season
    @divisions = $msf.msf_get_data(params[:league],params[:season], 'division_team_standings', 'json')["divisionteamstandings"]["division"]
   
  end

  def teamseason
  	# gamelog
  	@games = $msf.msf_get_data(params[:league], params[:season], 'team_gamelogs', 'json', 'team' => params[:Abbreviation])['teamgamelogs']['gamelogs']
    #@stats = $msf.msf_get_data(params[:league], params[:season], 'game_boxscore', 'json', 'gameid' => params[:gameid])['gameboxscore']
  end

end
