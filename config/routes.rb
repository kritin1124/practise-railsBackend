Rails.application.routes.draw do
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "/new", to: "management#new", as: :new
  post "/new", to: "management#create", as: :add
  get "/:id/edit", to: "management#edit", as: :edit
  patch "/:id", to:"management#update", as: :update
  delete "/:id", to:"management#delete",as: :destroy
  root "management#index", as: :root

end
