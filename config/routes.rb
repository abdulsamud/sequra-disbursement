Rails.application.routes.draw do
  namespace :api do
    resources :disbursements, only: %i[index]
  end
end
