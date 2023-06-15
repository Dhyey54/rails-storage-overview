class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User Created Successfully"
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "User Details Updated Successfully"
      redirect_to @user
    else
      flash[:error] = "Error Occured"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User destroyed successfully"
    else
      flash[:error] = "Error Occured"
    end

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :firstname, :lastname, :phonenumber, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
