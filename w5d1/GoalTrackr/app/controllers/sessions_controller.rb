class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in(@user)
      redirect_to goals_url
    else
      flash[:errors] = @users.errrors.full_messages
      render :new
    end
  end

  def destroy

  end

end
