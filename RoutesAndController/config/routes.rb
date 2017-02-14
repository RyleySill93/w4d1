Rails.application.routes.draw do
  # resources :users

    # get 'user' => 'user#index'
    # post 'user' => 'user#create'
    # get 'user/new' => 'user#new'
    # get 'user/:id/edit' => 'user#edit'
    # get 'user/:id' => 'user#show'
    # patch'user/:id' => 'user#update'
    # put'user/:id' => 'user#update'
    # delete 'user/:id' => 'user#destroy'

    resources :users, only: [:create, :destroy, :index, :show, :update] do
      resources :contacts, only:[:index]
    end

    resources :contacts, only:[:create, :destroy, :show, :update]
    resources :contact_shares, only:[:create, :destroy]


end
