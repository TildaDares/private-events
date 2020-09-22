class SessionsController < ApplicationController
  # before_action :login_required, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    user = User.find_by_name(params[:name]) 
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = "Invalid name"
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
