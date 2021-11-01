Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :minefields, only: [:create]

  scope "/minefields/:uuid" do
    delete "/",  action: :destroy, controller: :minefields 
    put "/toogle_pause_resume",  action: :toggle, controller: :minefields
    put "/squares", action: :update, controller: :squares
    put "/squares/red_flag", action: :red_flag, controller: :squares
    put "/squares/question_mark", action: :question_mark, controller: :squares
  end
end
