Rails.application.routes.draw do
	root "loans#index"

  resources :budgets
  resources :loans
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
