Rails.application.routes.draw do

  root 'marketing#index'
  devise_for :dealers
  namespace 'dealer' do
    resources :dealerships do
      resources :models, path: 'cars' do
        resources :images
      end
      collection do
        get 'carslist', to: 'models#cars_list'
      end
    end
  end

  namespace 'api', defaults: { format: :json} do
    namespace 'v1' do
      resources :dealerships, only: [:index, :show] do
        resources :models, only: [:show]
      end
    end
  end
end
