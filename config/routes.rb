Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"
  get "/contact", to: "application#contact"
  get "/projects", to: "application#projects"
  get "/blog", to: "application#blog"
  get "/about", to: "application#about"

  get "/article/:id", to: "application#article"
end
