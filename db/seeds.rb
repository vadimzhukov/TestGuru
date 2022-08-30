# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {name: "Vadim", email: "vadim@mail.com"},
  {name: "Andrey", email: "andrey@@mail.com"},
  {name: "Roman", email: "roman@mail.com"},
  {name: "Stephen King", email: "stephenking@mail.com"}
])

categories = Category.create([
  {title: 'Ruby'},
  {title: 'Rails'},
  {title: 'JS'},
  {title: 'DevOps'}
])

tests = Test.create([
  {title: 'Data types', level: 0, category_id: categories[0].id, author_id: users[3].id},
  {title: 'Blocks', level: 1, category_id: categories[0].id, author_id: users[3].id},
  {title: 'Modules', level: 1, category_id: categories[0].id, author_id: users[3].id},
  {title: 'Migrations', level: 2, category_id: categories[1].id, author_id: users[3].id},
  {title: 'async await', level: 2, category_id: categories[2].id, author_id: users[3].id},
  {title: 'k8s HPA', level: 6, category_id: categories[3].id, author_id: users[3].id}
])

questions = Question.create([
  {body: 'Какого типа данных нет в Ruby?', test_id: tests[0].id },
  {body: 'Какой метод служит для создания внешнего ключа в миграциях Ruby?', test_id: tests[3].id },
  {body: 'Что возвращает функция async (JS)', test_id: tests[4].id },
  {body: 'Что не является объектом в Ruby?', test_id: tests[0].id }
])

answers = Answer.create([
  {body: 'Boolean', correct: 0, question_id: questions[0].id},
  {body: 'varchar', correct: 1, question_id: questions[0].id},
  {body: 'add_reference', correct: 1, question_id: questions[1].id},
  {body: 'Boolean', correct: 0, question_id: questions[1].id},
  {body: 'Промис', correct: 1, question_id: questions[2].id},
  {body: 'True/False', correct: 0, question_id: questions[2].id},
  {body: 'Классы', correct: 0, question_id: questions[3].id},
  {body: 'Блоки', correct: 1, question_id: questions[3].id}
])
