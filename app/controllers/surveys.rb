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
    redirect "/surveys/#{survey.id}/new"
  else
    redirect '/'
  end
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  if current_user && @survey
    erb :'surveys/show'
  else
    redirect '/'
  end
end

post '/surveys/:survey_id' do
  responses = params[:question]
  responses.each do |question, choice|
    choice = Choice.find(choice)
    Response.create!(choice: choice, user: current_user)
  end
  redirect '/'
end

get '/surveys/:survey_id/new' do
  @survey = Survey.find(params[:survey_id])
  if current_user && @survey && current_user == @survey.creator
    erb :'surveys/new'
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
    redirect "/surveys/#{params[:survey_id]}/new"
  end
end
