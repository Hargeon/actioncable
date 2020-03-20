class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: user_params[:name])
    if user.present?
      cookies.signed[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    cookies.signed[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
