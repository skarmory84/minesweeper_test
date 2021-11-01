Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :minefields, only: [:create, :delete]

  scope "/minefields/:uuid/" do
    put "/squares", action: :update, controller: :squares
  end
end
