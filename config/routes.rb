Rails.application.routes.draw do
  # Application health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA related routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # ホームページのルート
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  # 診断テスト関連のルート
  get 'diagnostic_test/select_gender', to: 'diagnostic_test#select_gender', as: 'select_gender'
  get 'diagnostic_test/man', to: 'diagnostic_test#man', as: 'diagnostic_test_man'
  get 'diagnostic_test/woman', to: 'diagnostic_test#woman', as: 'diagnostic_test_woman' 
  get 'diagnostic_test/style', to: 'diagnostic_test#style', as: 'diagnostic_test_style'
  get 'diagnostic_test/result', to: 'diagnostic_test#result', as: 'diagnostic_test_result'
  get 'survey', to: 'static_pages#survey', as: 'survey'


  post 'diagnostic_test/result', to: 'diagnostic_test#result'  # POST リクエスト用
  
end
