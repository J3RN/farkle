Rails.application.routes.draw do
  root to: 'static_pages#home'

  get '/roll' =>  'game#roll'
  get '/value' => 'game#point_value'
end
