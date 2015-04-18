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