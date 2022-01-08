class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_users, only: %i[show edit update destroy]

  def index
    @users = User.all
    respond_to do |format|
      format.html
    end
  end

  def list
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
       redirect_to users_path
       flash[:notice] = "el #{@user.email} ha sido creado exitosamente."
    else
       flash[:notice] = "el users no pudo ser creado."
       render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
     redirect_to user_path
     flash[:notice] = "usuario #{@user.email} ha sido actualizado exitosamente."
    else
     render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

   private

  def set_user
    @prospect = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:mail, :pass)
  end
end
