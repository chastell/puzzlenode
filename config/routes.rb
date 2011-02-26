Puzzlenode::Application.routes.draw do
  root :to => 'home#index'

  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/logout', :to => 'sessions#destroy'
  match '/login',  :to => 'sessions#new'
  
  resources :puzzles do
    resources :comments,    :controller => 'Puzzles::Comments'
    resources :submissions, :controller => "Puzzles::Submissions"
  end
  
  resources :users do
    resources :submissions, :controller => "Users::Submissions"
  end
  
  namespace :admin do
    resources :puzzles
    resources :users
  end
end
