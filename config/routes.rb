Rails.application.routes.draw do
  resources :applications, param: :token, only: [:index, :create, :show, :update, :destroy] do
    collection do
      get '/:token', to: 'applications#show', as: ''
    end
    resources :chats, param: :number, only: [:index, :show, :create, :destroy] do
      resources :messages, param: :number, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
