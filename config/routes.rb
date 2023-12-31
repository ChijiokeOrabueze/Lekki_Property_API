Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace "api" do
    namespace "v1" do
      get "properties" => "properties#index"
      post "properties" => "properties#create"
      put "properties/:id" => "properties#update"
    end
  end
end
