#Survey routes

#index
get '/surveys' do
  #display all surveys
  # if session[:user_id]
    @surveys = Survey.all
    erb :'surveys/index'
  # else
  #   redirect '/'
  # end

end

#create
post '/surveys' do
  puts params
  @survey = Survey.create!(name: params[:name])
  redirect "/surveys/#{@survey.id}/new"
end

#new
get '/surveys/:id/new' do
  @questions = Survey.find(params[:id]).questions
  erb :"questions/index"
end


#show
get '/surveys/:id' do
    @survey = Survey.find(params[:id])
    erb :'surveys/show'
end

post '/surveys/:id/new' do
  puts params
  if request.xhr?
    question = Question.create(prompt: params[:prompt], survey_id: params[:id])
    choices = question.choices
    erb :"questions/show", locals: {question: question, choices: choices}, layout: false
  else
    redirect "/questions"
  end
end