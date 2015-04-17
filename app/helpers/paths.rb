# Change this to be your homepage path
def homepage
 "/"
end
# This logs out the user, change it to whatever your logout method will be
def logout
 "/users/logout"
end
# User login page, change Path if need be
def user_login
  "/users/login"
end
# User Creations page, change Path if need be
def user_new
  "/users/new"
end
# Default User Homepage
def user_homepage
  "/users/#{user_id}"
end