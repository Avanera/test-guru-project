# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(title: "Programming")

User.create(name: "Sam")
User.create(name: "Man")

Test.create(title: "Ruby", level: 1, category_id: 1, user_id:2)
Test.create(title: "Rails", level: 2, category_id: 1, user_id:2)
Test.create(title: "HTML", category_id: 1, user_id:2)
Test.create(title: "Machine Learning", category_id: 1, user_id:2)

Question.create(body: "Что такое отношение?", test_id: 2)

Answer.create(body: "Взаимная связь разных величин, предметов, действий.", correct: true, question_id: 1)
Answer.create(body: "Фундаментальное понятие реляционной модели данных.", correct: true, question_id: 1)
Answer.create(body: "Неправильный ответ.", question_id: 1)
