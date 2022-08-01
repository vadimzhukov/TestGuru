# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {name: "Vadim"},
  {name: "Andrey"},
  {name: "Roman"}
])

categories = Category.create([
  {title: 'Ruby'},
  {title: 'Rails'},
  {title: 'JS'}
])

tests = Test.create([
  {title: 'Data types', level: 0, category_id: Category.find_by(title: 'Ruby').id },
  {title: 'Blocks', level: 1, category_id: Category.find_by(title: 'Ruby').id },
  {title: 'Modules', level: 1, category_id: Category.find_by(title: 'Ruby').id },
  {title: 'Migrations', level: 2, category_id: Category.find_by(title: 'Rails').id },
  {title: 'async await', level: 2, category_id: Category.find_by(title: 'JS').id }
])

questions = Question.create([
  {body: 'Какого типа данных нет в Ruby?', test_id: Test.find_by(title: 'Data types').id },
  {body: 'Какой метод служит для создания внешнего ключа в миграциях Ruby?', test_id: Test.find_by(title: 'Migrations').id },
  {body: 'Что возвращает функция async (JS)', test_id: Test.find_by(title: 'async await').id }
])

answers = Answer.create([
  {body: 'Boolean', correct: 0, question_id: Question.find_by(body: 'Какого типа данных нет в Ruby?').id},
  {body: 'varchar', correct: 1, question_id: Question.find_by(body: 'Какого типа данных нет в Ruby?').id},
  {body: 'add_reference', correct: 1, question_id: Question.find_by(body: 'Какой метод служит для создания внешнего ключа в миграциях Ruby?').id},
  {body: 'Boolean', correct: 0, question_id: Question.find_by(body: 'Какой метод служит для создания внешнего ключа в миграциях Ruby?').id},
  {body: 'Промис', correct: 1, question_id: Question.find_by(body: 'Что возвращает функция async (JS)').id},
  {body: 'True/False', correct: 0, question_id: Question.find_by(body: 'Что возвращает функция async (JS)').id}
])