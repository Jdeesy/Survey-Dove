def current_user
  @user ||= User.find(session[:user_id]) if session[:user_id]
end

def user_id
  current_user.id
end