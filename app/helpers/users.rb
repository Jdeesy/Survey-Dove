def current_user
  @user ||= User.find(session[:user_id]) if session[:user_id]
end

def login
  ''
end

def logout
  ''
end

def user_new
  ''
end
