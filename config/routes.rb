Rails.application.routes.draw do
  get 'search/index'
  get 'delay_lists/index' => 'delay_lists/index'
  get '/' => 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
