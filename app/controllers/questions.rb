get '/questions/:id/new' do
  question = Question.find(params[:id])
  choices = question.choices
  erb :"questions/new", locals: {question: question, choices: choices}
end

post '/questions/:id/new' do
  puts params
  # if request.xhr?
    choice = Choice.create(name: params[:name], question_id: params[:id])
    erb :"choices/show", locals: {choice: choice}, layout: false
  # else
  #   redirect "/questions/"
  # end
end