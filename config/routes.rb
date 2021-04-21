Rails.application.routes.draw do
  #главная страница
  root 'posts#index', as: 'home'

  # путь для отображения страницы about, pages - контроллер, # about метод в этом контроллере
  get 'about' => 'pages#about', as: 'about'
  get 'contacts' => 'pages#contacts', as: 'contacts'

  #пути для контроллера posts
  resources :posts do
    resources :comments
  end


end
