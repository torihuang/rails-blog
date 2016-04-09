module ApplicationHelper
  def current_user
    return User.find_by(id: session[:user_id])
  end

   def logged_in?
     !!current_user
   end
end
