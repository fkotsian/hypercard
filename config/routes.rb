Rails.application.routes.draw do
  get 'flashcards/index'

  get 'flashcards/new'

  get 'flashcards/create'

  get 'flashcards/show'

  get 'flashcards/edit'

  get 'flashcards/update'

  get 'flashcards/destroy'

  devise_for :users do
    resources :flashcards
  end
  
  # root new_user_session_url
  
end
