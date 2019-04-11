Rails.application.routes.draw do
  get 'ticket_types/create'
  get 'ticket_types/destroy'
  get 'ticket_types/update'

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
  resources :users
  resources :events

  resources :event_venues
  resources :tickets

  resources :ticket_types do
    resources :tickets
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
