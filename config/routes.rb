Rails.application.routes.draw do
  resources :milestone_reports
  resources :project_reports
  resources :milestones
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
