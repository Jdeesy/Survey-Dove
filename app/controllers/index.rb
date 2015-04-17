#User routes
get '/' do
  if session[:user_id]
    redirect '/surveys'
  else
    erb :'index'
  end
end

