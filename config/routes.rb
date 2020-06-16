Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'search/index' => 'search#index'
  get 'delay_lists/index' => 'delay_lists/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
