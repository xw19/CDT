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
end
