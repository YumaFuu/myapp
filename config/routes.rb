Rails.application.routes.draw do
  resources :home
  root 'home#top'
  #トップページをhomeコントローラのtopアクションに設定

  get "/" => "home#top"
  get "/new" => "home#new"
  get "/:id" => "home#show"
  get "/:id/edit" => "home#edit"
  post "/create" => "home#create"
  post "/:id/update" => "home#update"
  post "/:id/destroy" => "home#destroy"

end
