Rails.application.routes.draw do
  get 'welcome/contact'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
