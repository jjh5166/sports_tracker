Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'leagues#index'

resources :pictures do
  resources :comments
end
get '/profile/:username', to:"users#profile", as:"user_profile"

get '/:league/:season/boxscore/:gameid/newpic', to: 'pictures#new', as: "new_pic"

get '/:league/:season/boxscore/:gameid', to: 'games#boxscore', as: "boxscore"

get '/:league/:season/:Abbreviation', to: "leagues#teamseason", as: "leagues_teamseason"

get '/:league/:season', to:"leagues#season", as:"leagues_season"

end
