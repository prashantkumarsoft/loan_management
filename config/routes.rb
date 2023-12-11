Rails.application.routes.draw do
  root 'businesses#new'
  resources :businesses do 
    get 'fetch_balance_sheet', on: :member
    post 'submit_application', on: :member
  end
end
