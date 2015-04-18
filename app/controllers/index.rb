#User routes
get '/' do
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

post '/questions' do
  puts params
  question = Question.create!(params)
  if request.xhr?
    erb :"questions/show", locals: {question: question}, layout: false
  else
    redirect "/questions"
  end
end