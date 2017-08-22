class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    user = User.new(pars)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(pars)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :not_acceptable
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.delete
      render plain: 'deleted!'
    else
      render plain: 'not found!'
    end
  end


  def pars
    pars = params[:user].permit(:name, :email)
    pars
  end



end
