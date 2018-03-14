class GamesController < ApplicationController
  USERNAME = open('lib/assets/.username').first.chomp
  PASSWORD = open('lib/assets/.password').first.chomp
def show

end

def season
  msf = MySportsFeeds.new(version="1.2", true)
  msf.authenticate(USERNAME, PASSWORD)
  @games = msf.msf_get_data('nba', '2016-2017-regular', 'full_game_schedule', 'json')["fullgameschedule"]["gameentry"]
end
def scoreboard
msf = MySportsFeeds.new(version="1.2", true)
msf.authenticate(USERNAME, PASSWORD)
@games = msf.msf_get_data(params[:league], '2016-2017-regular', 'scoreboard', 'json', 'fordate' => params[:date])['scoreboard']['gameScore']
end
def boxscore
  	msf = MySportsFeeds.new(version="1.2", true)
  	msf.authenticate(USERNAME, PASSWORD)
  		@games = msf.msf_get_data('nba', '2016-2017-regular', 'team_gamelogs', 'json', 'team' => params[:abbreviation])
  end
end
