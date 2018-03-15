class LeaguesController < ApplicationController
    USERNAME = open('lib/assets/.username').first.chomp
  	PASSWORD = open('lib/assets/.password').first.chomp

  def index

  end

  def show

  end

  def season

  end

  def teamseason
  	# gamelog
  	msf = MySportsFeeds.new(version="1.2", true)
	msf.authenticate('aciukurescu', 'NYCDAtest')
  	@games = msf.msf_get_data('nba', '2016-2017-regular', 'team_gamelogs', 'json', 'team' => params[:Abbreviation])['teamgamelogs']['gamelogs']
  end

end
