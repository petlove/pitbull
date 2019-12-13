# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/static' => 'static#check'
  get '/check' => 'checks#check'
  post '/authorization_api' => 'authorization_api#check'
end
