Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'leagues#index'

resources :pictures do
  resources :comments
end

get '/:league/scoreboard/:date', to: 'games#scoreboard'

get '/:league/boxscore/:gameid', to: 'games#boxscore'

get '/:league/schedule/:Abbreviation', to: "leagues#teamseason", as: "leagues_teamseason"

get '/:league/:season', to:"leagues#season", as:"leagues_season"



end
