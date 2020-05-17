# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category1 = Category.create(title: "Programming")

user1 = User.create(email: "kuku@mail.ru", password: "secret")
user2 = User.create(email: "raz@mail.ru", password: "secret")

test1 = Test.create(title: "Ruby", category_id: category1.id, user_id: user2.id)
test2 = Test.create(title: "Rails", category_id: category1.id, user_id: user2.id)
test3 = Test.create(title: "HTML", level: 1, category_id: category1.id, user_id: user2.id)
test4 = Test.create(title: "Machine Learning", level: 2, category_id: category1.id, user_id: user2.id)

question1 = Question.create(body: "What is a relation?", test_id: test2.id)

answer1 = Answer.create(body: "The interconnection of different quantities, objects, actions.", correct: true, question_id: question1.id)
answer2 = Answer.create(body: "The fundamental concept of a relational data model.", correct: true, question_id: question1.id)
answer3 = Answer.create(body: "Incorrect answer.", question_id: question1.id)

question2 = Question.create(body: "What is Ruby on Rails?", test_id: test2.id)

answer4 = Answer.create(body: "It is an object oriented programming language inspired by PERL and PYTHON.", correct: true, question_id: question2.id)
answer5 = Answer.create(body: "It is a framework used for building web application.", question_id: question2.id)
answer6 = Answer.create(body: "Incorrect answer.", question_id: question2.id)

question3 = Question.create(body: "Who invented Ruby?", test_id: test1.id)

answer7 = Answer.create(body: "Matz", correct: true, question_id: question3.id)
answer8 = Answer.create(body: "Queen Victoria", question_id: question3.id)
answer9 = Answer.create(body: "Trump", question_id: question3.id)

question4 = Question.create(body: "What is a default value of a variable?", test_id: test1.id)
answer10 = Answer.create(body: "nil", correct: true, question_id: question4.id)
answer11 = Answer.create(body: "false", question_id: question4.id)

badge1 = Badge.create(title: 'First badge', rule: 'category_complete')
badge2 = Badge.create(title: 'Second badge', rule: 'level_complete')
badge3 = Badge.create(title: 'Third badge', rule: 'first_try')
