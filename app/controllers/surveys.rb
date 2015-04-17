#Survey routes

#index
get '/surveys' do
  #display all surveys
  unless session[:user_id]
    redirect '/'
  else

  end

end

#new
get '/surveys/new' do
  unless session[:user_id]
    redirect '/'
  else

  end

end

#create
post '/surveys' do

end

#show
get '/surveys/:id' do
  unless session[:user_id]
    redirect '/'
  else
    erb :'surveys/show'
  end

  #if user has taken survey, show the results

  #else have them take the survey
end

