get '/users/login' do
  @error = nil
  erb :"users/login"
end

post '/users/login' do
  username = params[:user][:username]
  input_password = params[:user][:password]

  @user = User.authenticate(username, input_password)
  @user = User.find_by(username: username)

  if User.authenticate(username, input_password)
    session[:user_id] = @user.id
    redirect homepage
  else
    @error = "Invalid email/password"
    erb :"users/login"
  end
end

get '/users/new' do
  @user = User.new
  erb :"users/new_account"
end

post '/users/new' do
  @user = User.new(first_name: params[:user][:first_name],
                   last_name: params[:user][:last_name],
                   email: params[:user][:email],
                   username: params[:user][:username])

  @user.password=(params[:user][:password])
  session[:user_id] = @user.id
  if @user.errors.count == 0
    redirect homepage
  else
    @user
    erb :"users/new_account"
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect homepage
end

get '/users/:id' do
  erb :"users/show"
end