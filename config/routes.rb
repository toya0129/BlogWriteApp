Rails.application.routes.draw do
  root 'pages#top_page'
  get 'myPage', to: 'pages#my_page'

  scope module: 'user' do
    get 'sign_up', to: 'registration#new'
    post 'registration/create', to: 'registration#create'
    delete 'sign_out/:id', to: 'registration#destroy'

    get 'login', to: 'session#new'
    post 'session/create', to: 'session#create'
    get 'logout', to: 'session#destroy'

    resources :tweets, only:[:new,:create, :index, :destroy]
  end

  resources :user, :only => [:index,:show] do
    scope module: 'user' do
      resources :follows, :only => [:create,:destroy]
    end
  end

  resources :articles, :only => [:new,:create,:destroy,:show]
  resources :articles do
    resources :comments, :only => [:create, :destroy]
  end
end
