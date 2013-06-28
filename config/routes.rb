BrewDiary::Application.routes.draw do

  get   "/"                       => "members#root"              
  get   "/login"                  => "members#login",             as: "login"
  post  "/login"                  => "members#login_post",        as: "login_post"
  get   "/members/welcome"        => "members#welcome",           as: "welcome"
  get   "/members/welcome_admin"  => "members#welcome_admin",     as: "welcome_admin"
  post "/logout"                  => "members#logout",            as: "logout"
  
  resources :members, :recipes, :ingredients,
    only: [:index, :edit, :show, :update, :new, :create, :destroy]
end
