get '/users' do
  unless session[:user_id]
    redirect '/'
  else

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
