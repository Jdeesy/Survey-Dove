User.create!(name: 'Bob', email: 'bob@gmail.com', password: 'password')

Survey.create!(creator: User.find_by(name: 'Bob'), name: "Favorite Bobs in History")

Question.create!(survey: Survey.find_by(name: "Favorite Bobs in History"), prompt: "Am I the greatest?")

Choice.create!(question: Question.find_by(prompt: "Am I the greatest?"), name: "Yes")
Choice.create!(question: Question.find_by(prompt: "Am I the greatest?"), name: "No")

Response.create!(user: User.find_by(name: 'Bob'), choice: Choice.find_by(name: "Yes"))
