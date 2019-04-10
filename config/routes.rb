Rails.application.routes.draw do
  get 'tickets/create'
  get 'tickets/destroy'
  get 'tickets/update'
  get 'event_venues/create'
  get 'event_venues/destroy'
  get 'event_venues/update'
  get 'events/create'
  get 'events/destroy'
  get 'events/update'
  get 'users/create'
  get 'users/destroy'
  get 'users/update'
  get 'users/create'
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
