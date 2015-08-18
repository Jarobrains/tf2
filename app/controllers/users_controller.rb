class UsersController < ApplicationController
  before_action :check_if_user_or_admin, only: [:edit, :update, :destroy]


  def check_if_user_or_admin
    @user = User.find(params[:id])
    if current_user.id != @user.id && current_user.admin == false
      redirect_to root_url, notice: "You can't do that"
    end
  end


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:email]
    @user.image_url = params[:image_url]

    if @user.save
      redirect_to users_url, :notice => "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.email = params[:email]
    @user.image_url = params[:image_url]

    if @user.save
      redirect_to user_url(@user.id), :notice => "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to users_url, :notice => "User deleted."
  end
end
