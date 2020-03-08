# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Test.create(title: "Ruby", level: 1)
Test.create(title: "Rails", level: 2)
Test.create(title: "HTML")
Test.create(title: "Machine Learning")

User.create(name: "Sam", test_id: 1)
User.create(name: "Man", test_id: 2)

Category.create(title: "Programming")

Question.create(body: "Что такое отношение?")

Answer.create(option: "Взаимная связь разных величин, предметов, действий.")
Answer.create(option: "Фундаментальное понятие реляционной модели данных.")
Answer.create(option: "Неправильный ответ")
