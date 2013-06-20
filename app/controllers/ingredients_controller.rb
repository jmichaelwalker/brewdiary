class IngredientsController < ApplicationController

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

  def edit_ingredients
    @title = "Ingredients List"
    @ingredients = Ingredient.order("id")
    render :edit_ingredients and return
  end

  def edit_ingredient
    @title = "Edit Ingredients"
    @ingredient = Ingredient.where(id: params["id"]).first
    render :edit_ingredient and return
  end

  def update
    @ingredient              = Ingredient.where(id: params["ingredient_id"]).first
    @ingredient.ing_name     = params["ingredient"]["ing_name"]
    @ingredient.ing_type     = params["ingredient"]["ing_type"]
    @ingredient.color        = params["ingredient"]["color"]
    @ingredient.srm_ibu      = params["ingredient"]["srm_ibu"]
    @ingredient.other        = params["ingredient"]["other"]

    if @ingredient.save
      redirect_to ingredients_path and return
    else
      render :edit_ingredient and return
    end
  end

  def new_ingredient
    @ingredient = Ingredient.new
    render :new and return
  end
  
  def create_ingredient
    @ingredient              = Ingredient.where(id: params["ingredient_id"]).first
    @ingredient.ing_name     = params["ingredient"]["ing_name"]
    @ingredient.ing_type     = params["ingredient"]["ing_type"]
    @ingredient.color        = params["ingredient"]["color"]
    @ingredient.srm_ibu      = params["ingredient"]["srm_ibu"]
    @ingredient.other        = params["ingredient"]["other"]

    if @ingredient.save
      redirect_to ingredients_path and return
    else
      render :new_ingredient and return
    end
  end

  def destroy_ingredient
    @ingredient = Ingredient.where(id: params["id"]).first
    @ingredient.destroy
    redirect_to ingredients_path and return
  end

end

 