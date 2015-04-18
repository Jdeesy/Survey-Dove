post '/' do
  if user = User.authenticate(params[:email], params[:password])
    puts "test"
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Invalid email/password"]
    erb :index
  end
end

get '/users/new' do
  if current_user
    redirect '/'
  else
    erb :'users/new'
  end
end

post '/users/new' do
  @user = User.new(name: params[:name],
                   email: params[:email])
  @user.password = params[:password]
  if @user.save
    session[:user_id] = @user.id
    redirect "/surveys"
  else
    @errors = @user.errors.full_messages
    erb :"/users/new"
  end
end

post '/users' do

end

get '/users/logout' do
  user_logout
  redirect '/'
end

