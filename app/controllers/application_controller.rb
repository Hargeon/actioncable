class ApplicationController < ActionController::Base
  def current_user
    cookies.signed[:user_id] ? User.find(cookies.signed[:user_id]) : nil
  end
end
