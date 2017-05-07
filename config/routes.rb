Rails.application.routes.draw do
  namespace :admin do
    resources :accounts
    resources :account_rss_items
    resources :products
    resources :product_reviews
    resources :rss_items
    resources :rss_sites

    root to: "accounts#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
