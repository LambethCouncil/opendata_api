LambethAPI::Application.routes.draw do
 
  root :to => "visualise#index"
 
  namespace :api do
    scope "v1" do
      match "locations" => "locations#index"
      match "locations/gmaps" => "locations#gmaps"
      match "locations/categories" => "locations#categories"
      match "locations/category/:id" => "locations#category"
      match "locations/:id" => "locations#show"
      match "expenses" => "expenses#index"
      match "expenses/search" => "expenses#search"
      match "expenses/:id" => "expenses#show"
    end
  end
 
end 
