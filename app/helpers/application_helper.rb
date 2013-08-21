module ApplicationHelper

  def current_user
    return nil if session[:user_id].blank?
    @current_user ||= User.find session[:user_id]
  end

end
