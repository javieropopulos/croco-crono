Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: %i[] do
    resources :projects, only: %i[index new create show destroy edit update]
  end

  resources :projects, only: %i[] do
    resources :tasks, only: %i[index new create destroy edit update show]
    resources :introductions
    resources :conclusions
    patch '/tasks/:id/move_task_lower', to: 'tasks#move_task_lower', as: 'move_task_lower'
    patch '/tasks/:id/move_task_higher', to: 'tasks#move_task_higher', as: 'move_task_higher'
    patch '/introductions/:id/move_introduction_lower', to: 'introductions#move_introduction_lower', as: 'move_introduction_lower'
    patch '/introductions/:id/move_introduction_higher', to: 'introductions#move_introduction_higher', as: 'move_introduction_higher'
    patch '/conclusions/:id/move_conclusion_lower', to: 'conclusions#move_conclusion_lower', as: 'move_conclusion_lower'
    patch '/conclusions/:id/move_conclusion_higher', to: 'conclusions#move_conclusion_higher', as: 'move_conclusion_higher'
  end

  resources :tasks, only: %i[] do
    resources :comments, only: %i[index new create destroy edit update]
    patch '/comments/:id/move_comment_lower', to: 'comments#move_comment_lower', as: 'move_comment_lower'
    patch '/comments/:id/move_comment_higher', to: 'comments#move_comment_higher', as: 'move_comment_higher'
  end

  resources :tasks do
    collection do
      patch :sort
    end
  end

  resources :comments do
    collection do
      patch :sort
    end
  end
end
