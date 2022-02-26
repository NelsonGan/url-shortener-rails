Rails.application.routes.draw do
  # Error handling
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  # Root
  root 'home#index'

  # Links
  get 'links', to: 'links#index'
  get 'link/:id', to: 'links#show', as: 'link'
  post '/links', to: 'links#create'

  # Short link (Slug)
  get "/s/:slug", to: 'links#shorten'
end
