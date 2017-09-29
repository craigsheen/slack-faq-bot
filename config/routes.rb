Rails.application.routes.draw do
  resources :faqs
  root to: 'pages#index'
end
