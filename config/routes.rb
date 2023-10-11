Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  #get "users/sign_out", destroy_user_session_path
  get "/regression/linear", to: "regression#linear_regression"
  get "/regression/multiple", to: "regression#multiple_regression"
  get "/regression/gradient_descent", to: "regression#gradient_descent"
  get "/regression/polynomial", to: "regression#polynomial_regression"
end
