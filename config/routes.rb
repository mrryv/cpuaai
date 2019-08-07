Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get 'home/dashboard', to: 'home#dashboard', as: 'dashboard'
  get 'home', to: 'home#index', as: 'home'

  get 'election', to: 'election#show', as: 'election'
  get 'election_participants/:type/:id', to: 'election#participants', as: 'election_participants'
  post 'election/create', to: 'election#create', as: 'election_create'
  get 'election/delete/:id', to: 'election#delete', as: 'election_delete'

  get 'election/candidates', to: 'election#candidates', as: 'election_candidates'
  post 'election/position/create', to: 'election#position_create', as: 'position_create'
  get 'election/position/delete/:id', to: 'election#position_delete', as: 'position_delete'
  post 'election/candidate/create', to: 'election#candidate_create', as: 'candidate_create'
  get 'election/candidate/delete/:id', to: 'election#candidate_delete', as: 'candidate_delete'

  get 'student', to: 'student#show', as: 'directory'
  get 'student/delete/:id', to: 'student#delete', as: 'student_delete'
  post 'student/create', to: 'student#create', as: 'student_create'

  get 'events', to: 'events#show', as: 'events'
  get 'event/delete/:id', to: 'events#delete', as: 'event_delete'
  post 'event/approve', to: 'events#approve', as: 'event_approve'
  post 'event/create', to: 'events#create', as: 'event_create'

  get 'news', to: 'news#show', as: 'news'
  post 'news/create', to: 'news#create', as: 'news_create'
  get 'news/delete/:id', to: 'news#delete', as: 'news_delete'
end
