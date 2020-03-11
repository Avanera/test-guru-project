# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category1 = Category.create(title: "Programming")

user1 = User.create(name: "Sam")
user2 = User.create(name: "Man")

test1 = Test.create(title: "Ruby", level: 1, category_id: category1.id, user_id: user2.id)
test2 = Test.create(title: "Rails", level: 2, category_id: category1.id, user_id: user2.id)
test3 = Test.create(title: "HTML", category_id: category1.id, user_id: user2.id)
test4 = Test.create(title: "Machine Learning", category_id: category1.id, user_id: user2.id)

question1 = Question.create(body: "Что такое отношение?", test_id: test2.id)

answer1 = Answer.create(body: "Взаимная связь разных величин, предметов, действий.", correct: true, question_id: question1.id)
answer2 = Answer.create(body: "Фундаментальное понятие реляционной модели данных.", correct: true, question_id: question1.id)
answer3 = Answer.create(body: "Неправильный ответ.", question_id: question1.id)
