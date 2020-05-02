Rails.application.routes.draw do
  scope '(:locale)', locale: /en|fr/ do
    root to: 'pages#home'
    resources :messages, only: :create, defaults: { format: :js }
  end
end
