Rails.application.routes.draw do
  get "static_pages/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Application health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA related routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  root 'static_pages#home'
  # Set root to diagnostic_test#woman
  get 'diagnostic_test/result', to: 'diagnostic_test#result'
  # Route for accessing diagnostic_test#woman directly
  get 'diagnostic_test/woman', to: 'diagnostic_test#woman'
end
