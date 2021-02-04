Rails.application.routes.draw do
  scope '(:locale)', locale: /en|fr/ do
    root to: 'pages#home'
    resources :messages, only: :create, constraints: { format: /(json|js|html)/ }
  end
end
