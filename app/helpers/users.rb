def current_user
  @user ||= User.find(session[:user_id]) if session[:user_id]
end

def user_login
  ''
end

def user_logout
  ''
end

def user_new
  ''
end