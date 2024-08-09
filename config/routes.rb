Rails.application.routes.draw do
  resources :applications, param: :token, only: [:index, :create, :show, :update, :destroy] do
    collection do
      get '/:token', to: 'applications#show', as: ''
    end
  end
end
