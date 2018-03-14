Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'games#scoreboard'

get '/:league/scoreboard/:date', to: 'games#scoreboard'
end
