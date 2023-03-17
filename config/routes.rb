Rails.application.routes.draw do
  root to: 'news#index'
  get '/search', to: 'news#search', as: 'search_news'
end
