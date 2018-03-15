Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'games#season'

get '/:league/scoreboard/:date', to: 'games#scoreboard'

get '/:league/boxscore/:gameid', to: 'games#boxscore' 

get '/:league/teamgamelogs/:Abbreviation', to: "leagues#teamseason"




end
