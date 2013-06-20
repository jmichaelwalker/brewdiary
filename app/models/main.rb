class MainController < ApplicationController

get "/"  do
  redirect "/login"
end

get "/login"  do
  session.clear
  halt erb(:login, layout: false)
end

post "/login" do
  found_member = Member.where(username: params["username"]).first
  if found_member && params["password"] == found_member.password
    if found_member.mem_type == "Admin"
      session["found_member_id"] = found_member.id
      redirect "/welcome_admin"
    else
      session["found_member_id"] = found_member.id
      redirect "/welcome"
    end
  else
    halt erb(:login, layout: false)
  end
end

get "/welcome" do
  @member = Member.where(id: session["found_member_id"]).first
  if @member == nil
    redirect "/login"
  else
    halt erb(:welcome)
  end
end

get "/welcome_admin" do
  @member = Member.where(id: session["found_member_id"]).first
  if @member == nil || @member.mem_type != "Admin"
    redirect "/login"
  else
    halt erb(:welcome_admin)
  end
end

get "/members" do
  @member = Member.where(id: session["found_member_id"]).first
  if @member == nil
    redirect "/login"
  else
    if @member.mem_type != "Admin"
      redirect "/welcome"
    else
      @all_members = Member.order("id").all
      halt erb(:members)
    end
  end
end

post "/members" do
  if params["edit"]
    member = Member.where(id: params["edit"]).first
    redirect "/member/#{member.id}"
  elsif params["delete"]
    member_id = params["delete"]
    member = Member.where(id: member_id).first
    member.destroy
    redirect "/members"
  elsif params["new"]
    redirect "/member/new"
  end
end

get "/new_member" do
  params["member_id"] == "new"
  @member = Member.new
  halt erb(:new_member, layout: false)
end

post "/new_member" do
  new_member              = Member.new
  new_member.username     = params["username"]
  new_member.mem_type     = "User"
  new_member.first_name   = params["first_name"]
  new_member.last_name    = params["last_name"]
  new_member.email        = params["email"]
  new_member.other        = params["other"]
  new_member.save!
  
  redirect "/welcome"
end

get "/member/:member_id" do
  @member = Member.where(id: session["found_member_id"]).first
  if @member == nil
    redirect "/login"
  else
    if params["member_id"] == "new"
      @member = Member.new
    else
      @member = Member.where(id: params["member_id"]).first
    end
  end
    halt erb(:member)
end

post "/member/:member_id" do
  if params["member_id"] == "new"
    new_member              = Member.new
    new_member.username     = params["username"]
    new_member.mem_type     = params["mem_type"]
    new_member.first_name   = params["first_name"]
    new_member.last_name    = params["last_name"]
    new_member.email        = params["email"]
    new_member.other        = params["other"]
    new_member.save!
    
    redirect "/members"

  else
    @member             = Member.where(id: params["member_id"]).first
    member.username     = params["username"]
    member.mem_type     = params["mem_type"]
    member.first_name   = params["first_name"]
    member.last_name    = params["last_name"]
    member.email        = params["email"]
    member.other        = params["other"]
    if @member.save
      redirect "/members"
    else
      halt erb(:member)
    end
  end
end

get "/ingredients" do
  @member = Member.where(id: session["found_member_id"]).first
  if @member == nil
    redirect "/login"
  else
    @ingredients = Ingredient.order("id").all
    halt erb(:ingredients)
  end
end

post "/ingredients" do
  if params["edit"]
    ingredient = Ingredient.where(id: params["edit"]).first
    redirect "/ingredient/#{ingredient.id}"
  elsif params["delete"]
    ingredient_id = params["delete"]
    ingredient = Ingredient.where(id: ingredient_id).first
    ingredient.destroy
    redirect "/ingredients"
  elsif params["new"]
    redirect "/ingredient/new"
  end
end


get "/ingredient/:ingredient_id" do
  @member = Member.where(id: session["found_member_id"]).first
  if @member == nil
    redirect "/login"
  else
    if params["ingredient_id"] == "new"
      @ingredient = Ingredient.new
    else
      @ingredient = Ingredient.where(id: params["ingredient_id"]).first
    end
  end
    halt erb(:ingredient)
end

post "/ingredient/:ingredient_id" do
  if params["ingredient_id"] == "new"
    new_ingredient              = Ingredient.new
    new_ingredient.ing_name     = params["ing_name"]
    new_ingredient.ing_type     = params["ing_type"]
    new_ingredient.color        = params["color"]
    new_ingredient.srm_ibu      = params["srm_ibu"]
    new_ingredient.other        = params["other"]
    new_ingredient.save!
    
    redirect "/ingredients"

  else
    @ingredient             = Ingredient.where(id: params["ingredient_id"]).first
    ingredient.ing_name     = params["ing_name"]
    ingredient.ing_type     = params["ing_type"]
    ingredient.color        = params["color"]
    ingredient.srm_ibu      = params["srm_ibu"]
    ingredient.other        = params["other"]
    if @ingredient.save
      redirect "/ingredients"
    else
      halt erb(:ingredient)
    end
  end
end

get "/recipes" do
  @member = Member.where(id: session["found_member_id"]).first
  if @member == nil
    redirect "/login"
  else
    @recipes = BeerRecipe.order("id").all
    halt erb(:recipes)
  end
end

post "/recipes" do
  if params["edit"]
    recipe = BeerRecipe.where(id: params["edit"]).first
    redirect "/recipe/#{recipe.id}"
  elsif params["delete"]
    recipe_id = params["delete"]
    recipe = BeerRecipe.where(id: recipe_id).first
    recipe.destroy
    redirect "/recipes"
  elsif params["new"]
    redirect "/recipe/new"
  end
end

get "/recipe/:recipe_id" do
  @member = Member.where(id: session["found_member_id"]).first
  if @member == nil
    redirect "/login"
  else
    if params["recipe_id"] == "new"
      @recipe = BeerRecipe.new
      @ingredients = Ingredient.where(beer_recipes_id: "recipe_id").order

    else
      @recipe = BeerRecipe.where(id: params["recipe_id"]).first
      #@ingredients = Ingredient.where(beer_recipes_id: "recipe_id").order
    end
  end
    halt erb(:recipe)
end

post "/recipe/:recipe_id" do
  if params["recipe_id"] == "new"
    new_recipe                    = recipe.new
    new_recipe.recipe_name        = params["recipe_name"]
    new_recipe.recipe_type        = params["recipe_type"]
    new_recipe.brew_date          = params["brew_date"]
    new_recipe.yeast_starter      = params["yeast_starter"]
    new_recipe.batch_size         = params["batch_size"]
    new_recipe.mash_time          = params["mash_time"]
    new_recipe.mash_temp          = params["mash_temp"]
    new_recipe.mash_steps         = params["mash_steps"]
    new_recipe.boil_time          = params["boil_time"]
    new_recipe.pri_ferm_days      = params["pri_ferm_days"]
    new_recipe.pri_ferm_temp      = params["pri_ferm_temp"]
    new_recipe.pri_ferm_notes     = params["pri_ferm_notes"]
    new_recipe.sec_ferm_days      = params["sec_ferm_days"]
    new_recipe.sec_ferm_temp      = params["sec_ferm_temp"]
    new_recipe.sec_ferm_notes     = params["sec_ferm_notes"]
    new_recipe.org_gravity        = params["org_gravity"]
    new_recipe.org_gravity_temp   = params["org_gravity_temp"]
    new_recipe.final_gravity      = params["final_gravity"]
    new_recipe.final_gravity_temp = params["final_gravity_temp"]
    new_recipe.ibu                = params["ibu"]
    new_recipe.color              = params["color"]
    new_recipe.cooking_steps      = params["cooking_steps"]
    new_recipe.taste_rating       = params["taste_rating"]
    new_recipe.tasting_notes      = params["tasting_notes"]
    new_recipe.review             = params["review"]
    new_recipe.save!
    
    redirect "/recipes"

  else
    @recipe                       = BeerRecipe.where(id: params["recipe_id"]).first
    recipe.recipe_name        = params["recipe_name"]
    recipe.recipe_type        = params["recipe_type"]
    recipe.brew_date          = params["brew_date"]
    recipe.yeast_starter      = params["yeast_starter"]
    recipe.batch_size         = params["batch_size"]
    recipe.mash_time          = params["mash_time"]
    recipe.mash_temp          = params["mash_temp"]
    recipe.mash_steps         = params["mash_steps"]
    recipe.boil_time          = params["boil_time"]
    recipe.pri_ferm_days      = params["pri_ferm_days"]
    recipe.pri_ferm_temp      = params["pri_ferm_temp"]
    recipe.pri_ferm_notes     = params["pri_ferm_notes"]
    recipe.sec_ferm_days      = params["sec_ferm_days"]
    recipe.sec_ferm_temp      = params["sec_ferm_temp"]
    recipe.sec_ferm_notes     = params["sec_ferm_notes"]
    recipe.org_gravity        = params["org_gravity"]
    recipe.org_gravity_temp   = params["org_gravity_temp"]
    recipe.final_gravity      = params["final_gravity"]
    recipe.final_gravity_temp = params["final_gravity_temp"]
    recipe.ibu                = params["ibu"]
    recipe.color              = params["color"]
    recipe.cooking_steps      = params["cooking_steps"]
    recipe.taste_rating       = params["taste_rating"]
    recipe.tasting_notes      = params["tasting_notes"]
    recipe.review             = params["review"]
    if @recipe.save
      redirect "/recipes"
    else
      halt erb(:recipe)
    end
  end
end
 