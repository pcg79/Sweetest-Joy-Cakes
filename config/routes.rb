JoysCakes::Application.routes.draw do |map|
  resources :categories
  resources :cakes
  resources :cake_pictures

  root :to => 'content#index'

  match '/contact' => 'content#contact', :as => :contact

  # match '/birthdays' => 'cakes#birthdays', :as => :birthdays
  # match '/weddings'  => 'cakes#weddings',  :as => :weddings
  # match '/others'    => 'cakes#other',     :as => :other
  # match '/practice'  => 'cakes#practice',  :as => :practice

  match '/contact_submit' => 'content#contact_submit', :as => :contact_submit
end
