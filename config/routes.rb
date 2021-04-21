Rails.application.routes.draw do

  devise_for :users
  #главная страница
  root to: 'posts#index', as: 'home'
  get 'home/index'

  # devise_for :users
  # root to: "home#index"

  # путь для отображения страницы about, pages - контроллер, # about метод в этом контроллере
  get 'about' => 'pages#about', as: 'about'
  #get 'contacts' => 'pages#contacts', as: 'contacts'

  #пути для контроллера posts
  resources :posts do
    resources :comments
  end

  resource :contacts, only: [:new, :create], path_names: {:new => ''} #или get 'contacts' => 'contacts#new'

end
