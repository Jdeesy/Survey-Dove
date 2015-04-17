get '/users' do
  unless session[:user_id]
    redirect '/'
  else

  end
end

post '/' do
  user = User.find_by(email: params[:email])

  # if user && user.password_hash = params[:password]
  # session[:user_id] =
  # unless session[:user_id]
  #   redirect '/'
end

get '/users/new' do
  unless session[:user_id]
    redirect '/'
  else

  end

end

post '/users' do

end
