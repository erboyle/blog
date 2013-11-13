class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find( params[:id] )
  end

  def update
    @user = User.find( params[:id] )
    if @user.update_attributes( user_params )
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find( params[:id] )

  end

  def destroy
    @user = User.find( params[:id] )
    @user.destroy
  end

  def sign_in
    @user = User.new
  end
  
  def sign_out
    @user = User.find( params[:id])
  end
  
  def auth
    @user = User.find_by_email( params[:user][:email] )
    unless @user.nil?
      if @user.password == params[:user][:password]
        redirect_to posts_path
        return
      end
    end
    redirect_to sign_in_path
  end
  
  private
    def user_params
      params.require(:user).permit( :first_name, :last_name, :email, :password )
    end
end
