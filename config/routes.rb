Rails.application.routes.draw do
  root to: 'urls#index'

  get ':shortened_url', to: 'urls#show', param: :shortened_url, as: :show
  get ':shortened_url/info', to: 'urls#info', param: :shortened_url, as: :info

  resources :urls, only: [:index, :create], param: :shortened_url
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
