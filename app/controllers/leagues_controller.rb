class LeaguesController < ApplicationController

  def index

  end

  def show

  end

  def season

  end

  def teamseason
  	# gamelog
  	@games = $msf.msf_get_data(params[:league], '2016-2017-regular', 'team_gamelogs', 'json', 'team' => params[:Abbreviation])['teamgamelogs']['gamelogs']
  end

end
