Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"

  # TODO: The :number argument should have a digit constraint.
  get "/:user/:repo/issues", to: "issues#index", as: "issues"
  get "/:user/:repo/issues/:number", to: "issues#show", as: "issue"
  post "/:user/:repo/issues/:number/comment", to: "issues#comment", as: "comments"

  # TODO: Move this to a separate controller
  post "/preview", to: "issues#preview", as: "preview"
end
