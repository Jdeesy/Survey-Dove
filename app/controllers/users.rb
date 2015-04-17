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
  unless session[:user_id]
    redirect '/'
  else

  end

end

post '/users' do

end

get '/users/logout' do
  user_logout
  redirect '/'
end
