Rails.application.routes.draw do
  resource :orders, only: :create
end
