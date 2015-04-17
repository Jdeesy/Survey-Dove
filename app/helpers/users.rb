def current_user
  @user ||= User.find(session[:user_id]) if session[:user_id]
end

def user_login
  ''
end

def user_logout
  session[:user_id] = nil
end

def user_new
  '/users/new'
end

def logout
  '/users/logout'
end
