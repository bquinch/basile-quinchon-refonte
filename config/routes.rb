Rails.application.routes.draw do
  scope '(:locale)', locale: /en|fr/ do
    root to: 'pages#home'
    resources :messages, only: :create, constraints: { format: /(json|turbo_stream|html)/ }
    post "pages/append_form", to: "pages#append_form", constraints: { format: :turbo_stream }
    post "pages/cancel_form", to: "pages#cancel_form", constraints: { format: :turbo_stream }
    post "pages/replace_partial", to: "pages#replace_partial"
  end
end
