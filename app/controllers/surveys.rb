# before '/*' do
#   redirect '/' unless current_user
# end

get '/surveys' do
  @surveys = Survey.all
  if current_user
    erb :'surveys/index'
  else
    redirect '/'
  end
end

post '/surveys' do
  if current_user
    survey = Survey.create!(name: params[:survey][:name], creator: current_user)
    redirect "/surveys/#{survey.id}/edit"
  else
    redirect '/'
  end
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  if current_user && @survey
    if @survey.responders.any?{ |user| user.id == session[:user_id] } 
      redirect "/surveys/#{@survey.id}/results"
    else
      erb :'surveys/show'
    end
  else
    redirect '/'
  end
end

get '/surveys/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  if current_user && @survey
    erb :'surveys/results'
  else
    redirect '/'
  end
end


post '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  responses = params[:question]
  if responses
    responses.each do |question, choice|
      choice = Choice.find(choice)
      Response.create!(choice: choice, user: current_user)
    end
    redirect "/surveys/#{@survey.id}/results"
  else
    erb :'surveys/show'
  end
end

get '/surveys/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  if current_user && @survey && current_user == @survey.creator
    erb :'surveys/edit'
  else
    redirect '/'
  end
end

post '/surveys/:survey_id/questions' do
  survey = Survey.find(params[:survey_id])
  if request.xhr? && survey
    question = Question.create!(prompt: params[:question][:prompt], survey: survey)
    erb :"questions/_show", locals: {question: question}, layout: false
  else
    redirect "/surveys/#{params[:survey_id]}"
  end
end

post '/surveys/:survey_id/questions/:question_id' do
  survey = Survey.find(params[:survey_id])
  question = Question.find(params[:question_id])
  if request.xhr? && survey && question
    choice = Choice.create!(name: params[:choice][:name], question: question)
    erb :"choices/_show", locals: {choice: choice}, layout: false
  else
    redirect "/surveys/#{params[:survey_id]}/edit"
  end
end
