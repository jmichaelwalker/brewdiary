class MembersController < ApplicationController

  before_filter(except: ["login", "login_post", "logout"]) do
    if session[:member_id] != nil
      @member = Member.where(id: session[:member_id]).first
    else
      flash[:error] = "You must be logged in to see that page."
      redirect_to :login and return
    end
  end

  def root
    redirect_to login and return
  end

  def login
    @title = "Member Login"
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
      redirect_to :welcome and return
    end
  end

  get :welcome do
    @member = Member.where(id: session["found_member_id"]).first
    if @member == nil
      redirect_to :login and return
    else
      render :welcome and return
    end
  end

  get :welcome_admin do
    @member = Member.where(id: session["found_member_id"]).first
    if @member == nil || @member.mem_type != "Admin"
      redirect_to :login and return
    else
      render :welcome_admin and return
    end
  end


  def index
    @title = "Members List"
    render :index and return
  end

  def edit
    @member = Member.where(id: session["found_member_id"]).first
    if @member == nil
      redirect "/login"
    else
      if @member.mem_type != "Admin"
        redirect "/welcome"
      else
        @all_members = Member.order("id").all
        render :edit and return
      end
    end
  end

  def update
    @member              = Member.find(params["id"])
    @member.username     = params["member"]["username"]
    @member.mem_type     = "User"
    @member.first_name   = params["member"]["first_name"]
    @member.last_name    = params["member"]["last_name"]
    @member.email        = params["member"]["email"]
    @member.other        = params["member"]["other"]
    
    if @member.save
      rediret_to members_path and return
    else
      render :update and return
    end
  end

  def new
    @title = "Add New Member"
    @member = Member.new
    render :new and return
  end

  def create
    @member              = Member.new
    @member.username     = params["member"]["username"]
    @member.mem_type     = "User"
    @member.first_name   = params["member"]["first_name"]
    @member.last_name    = params["member"]["last_name"]
    @member.email        = params["member"]["email"]
    @member.other        = params["member"]["other"]

    if @member.save
      redirect_to members_path and return
    else
      render :new and return
    end
  end
  
  def destroy
    @member = Member.where(id: params["member_id"]).first
    @member.destroy
    redirect_to members_path and return
  end



end

 