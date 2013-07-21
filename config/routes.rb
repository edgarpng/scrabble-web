ScrabbleWeb::Application.routes.draw do
  root to: "words#index"
  resources :words do
    post 'play', on: :member
  end
end