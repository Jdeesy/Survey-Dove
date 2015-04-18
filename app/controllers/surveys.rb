#Survey routes

#index
get '/surveys' do
  #display all surveys
  if current_user
    erb :'surveys/index'
  else
    redirect '/'
  end

end

#create
post '/surveys' do
  if current_user
    survey = Survey.create!(name: params[:survey][:name], creator: current_user)
    redirect "/surveys/#{survey.id}/new"
  else
    redirect '/'
  end
end

#show
get '/surveys/:id/new' do
  @survey = Survey.find(params[:id])
  if current_user && @survey && current_user == Survey.find(params[:id]).creator
    erb :'surveys/new'
  else
    redirect '/'
  end
end


#show
get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  if current_user && @survey
    erb :'surveys/new'
  else
    redirect '/'
  end
end


