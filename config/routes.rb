Rails.application.routes.draw do
  # get 'topics/index'

  # get 'topics/new'

  # get 'topics/show'

  # get 'topics/edit'

  devise_for :users
  resources :users, only: [:update]
  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/new'

  # get 'posts/edit'
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end

  # get 'welcome/index'

  # get 'welcome/about'

  # get 'welcome/contact'
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
