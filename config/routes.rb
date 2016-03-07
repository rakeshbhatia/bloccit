Rails.application.routes.draw do
  resources :sponsored_posts do
    resources :topics, except: [:index]
  end

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
