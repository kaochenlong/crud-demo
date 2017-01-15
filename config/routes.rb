# rails routes 查看所有路徑

Rails.application.routes.draw do
  root "welcome#index"
  resources :candidates do
    member do
      put :vote
    end
  end
end
