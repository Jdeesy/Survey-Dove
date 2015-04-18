#User routes
get '/' do
  session[:user_id] =1
  if session[:user_id]
    redirect '/surveys'
  else
    erb :'index'
  end
end

get '/choices' do
  @choices = Choice.all
  erb :"choices/index", locals: {choices: @choices}
end

post '/choices' do
  puts params
  choice = Choice.create!(params)
  if request.xhr?
    erb :"choices/show", locals: {choice: choice}, layout: false
  else
    redirect "/choices"
  end
end

get "/questions" do
  @questions = Question.all
  erb :"questions/index", locals: {questions: @questions}
end

post '/questions/choice' do

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
    redirect "/surveys/#{params[:survey_id]}"
  end
end