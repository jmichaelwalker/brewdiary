class BrewsController < ApplicationController

  before_filter(except: ["login", "login_post", "logout"]) do
    if session[:member_id] != nil
      @member = Member.where(id: session[:member_id]).first
    else
      flash[:error] = "You must be logged in to see that page."
      redirect_to "/member_login" and return
    end
  end

  def login
    @title = "Login"
    render :login and return
  end

  def login_post
    username = params[:username]
    password = params[:password]
    member = Member.where(username: username).first

    if member == nil
      flash.now[:error] = "Unknown username"
      render :login and return
    elsif password != member.password
      flash.now[:error] = "Wrong password"
      render :login and return
    else 
      session[:member_id] = member.id
      redirect_to "/recipes" and return
    end
  end

  def edit_recipes
    @title = "Recipes List"
    @recipes = Recipe.order("id")
    render :edit_recipes and return
  end

  def edit_recipe
    @title = "Edit Recipe"
    @recipe = Recipe.where(id: params["id"]).first
    render :edit_recipe and return
  end

  def update
    @recipe                   = BeerRecipe.where(id: params["recipe_id"]).first
    @recipe.recipe_name        = params['recipe']["recipe_name"]
    @recipe.recipe_type        = params['recipe']["recipe_type"]
    @recipe.brew_date          = params['recipe']["brew_date"]
    @recipe.yeast_starter      = params['recipe']["yeast_starter"]
    @recipe.batch_size         = params['recipe']["batch_size"]
    @recipe.mash_time          = params['recipe']["mash_time"]
    @recipe.mash_temp          = params['recipe']["mash_temp"]
    @recipe.mash_steps         = params['recipe']["mash_steps"]
    @recipe.boil_time          = params['recipe']["boil_time"]
    @recipe.pri_ferm_days      = params['recipe']["pri_ferm_days"]
    @recipe.pri_ferm_temp      = params['recipe']["pri_ferm_temp"]
    @recipe.pri_ferm_notes     = params['recipe']["pri_ferm_notes"]
    @recipe.sec_ferm_days      = params['recipe']["sec_ferm_days"]
    @recipe.sec_ferm_temp      = params['recipe']["sec_ferm_temp"]
    @recipe.sec_ferm_notes     = params['recipe']["sec_ferm_notes"]
    @recipe.org_gravity        = params['recipe']["org_gravity"]
    @recipe.org_gravity_temp   = params['recipe']["org_gravity_temp"]
    @recipe.final_gravity      = params['recipe']["final_gravity"]
    @recipe.final_gravity_temp = params['recipe']["final_gravity_temp"]
    @recipe.ibu                = params['recipe']["ibu"]
    @recipe.color              = params['recipe']["color"]
    @recipe.cooking_steps      = params['recipe']["cooking_steps"]
    @recipe.taste_rating       = params['recipe']["taste_rating"]
    @recipe.tasting_notes      = params['recipe']["tasting_notes"]
    @recipe.review             = params['recipe']["review"]
    
    if @recipe.save
      redirect_to recipes_path and return
    else
      render :edit_recipe and return
    end
  end

  def new_recipe
    @recipe = Recipe.new
    render :new and return
  end
  
  def create_recipe
    @recipe                   = BeerRecipe.where(id: params["recipe_id"]).first
    @recipe.recipe_name        = params['recipe']["recipe_name"]
    @recipe.recipe_type        = params['recipe']["recipe_type"]
    @recipe.brew_date          = params['recipe']["brew_date"]
    @recipe.yeast_starter      = params['recipe']["yeast_starter"]
    @recipe.batch_size         = params['recipe']["batch_size"]
    @recipe.mash_time          = params['recipe']["mash_time"]
    @recipe.mash_temp          = params['recipe']["mash_temp"]
    @recipe.mash_steps         = params['recipe']["mash_steps"]
    @recipe.boil_time          = params['recipe']["boil_time"]
    @recipe.pri_ferm_days      = params['recipe']["pri_ferm_days"]
    @recipe.pri_ferm_temp      = params['recipe']["pri_ferm_temp"]
    @recipe.pri_ferm_notes     = params['recipe']["pri_ferm_notes"]
    @recipe.sec_ferm_days      = params['recipe']["sec_ferm_days"]
    @recipe.sec_ferm_temp      = params['recipe']["sec_ferm_temp"]
    @recipe.sec_ferm_notes     = params['recipe']["sec_ferm_notes"]
    @recipe.org_gravity        = params['recipe']["org_gravity"]
    @recipe.org_gravity_temp   = params['recipe']["org_gravity_temp"]
    @recipe.final_gravity      = params['recipe']["final_gravity"]
    @recipe.final_gravity_temp = params['recipe']["final_gravity_temp"]
    @recipe.ibu                = params['recipe']["ibu"]
    @recipe.color              = params['recipe']["color"]
    @recipe.cooking_steps      = params['recipe']["cooking_steps"]
    @recipe.taste_rating       = params['recipe']["taste_rating"]
    @recipe.tasting_notes      = params['recipe']["tasting_notes"]
    @recipe.review             = params['recipe']["review"]
    
    if @recipe.save
      redirect_to recipes_path and return
    else
      render :new_recipe and return
    end
  end

  def destroy_recipe
    @recipe = Recipe.where(id: params["id"]).first
    @recipe.destroy
    redirect_to recipes_path and return
  end

end

 