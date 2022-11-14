# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users = User.create([
#                       { name: 'Vadim', email: 'vadim@mail.com', password: '123456', password_confirmation: '123456' },
#                       { name: 'Andrey', email: 'andrey@@mail.com', password: '123456',
#                         password_confirmation: '123456' },
#                       { name: 'Roman', email: 'roman@mail.com', password: '123456', password_confirmation: '123456' },
#                       { name: 'Stephen King', email: 'stephenking@mail.com', password: '123456',
#                         password_confirmation: '123456' }
#                     ])

user1 = User.new(name: 'Vadim', last_name: 'Zhukov', email: 'admin@testguru.com', password: '123456',
                 password_confirmation: '123456', type: 'Admin')
user1.skip_confirmation!
user1.save!

user2 = User.new(name: 'Sergey', last_name: 'Segeev', email: 'user@testguru.com', password: '123456',
                 password_confirmation: '123456', type: 'User')
user2.skip_confirmation!
user2.save!

categories = Category.create([
                               { title: 'Ruby' },
                               { title: 'Rails' },
                               { title: 'JS' },
                               { title: 'DevOps' }
                             ])

tests = Test.create([
                      { title: 'Data types', level: 0, category: categories[0], author: user1 },
                      { title: 'Blocks', level: 1, category: categories[0], author: user1 },
                      { title: 'Modules', level: 1, category: categories[0], author: user1 },
                      { title: 'Migrations', level: 2, category: categories[1], author: user1 },
                      { title: 'async await', level: 2, category: categories[2], author: user1 },
                      { title: 'k8s HPA', level: 6, category: categories[3], author: user1 }
                    ])

questions = Question.create([
                              { body: 'Какого типа данных нет в Ruby?', test: tests[0] },
                              { body: 'Какой метод служит для создания внешнего ключа в миграциях Ruby?',
                                test: tests[3] },
                              { body: 'Что возвращает функция async (JS)', test: tests[4] },
                              { body: 'Что не является объектом в Ruby?', test: tests[0] }
                            ])

answers = Answer.create([
                          { body: 'Boolean', correct: 0, question: questions[0] },
                          { body: 'varchar', correct: 1, question: questions[0] },
                          { body: 'add_reference', correct: 1, question: questions[1] },
                          { body: 'Boolean', correct: 0, question: questions[1] },
                          { body: 'Промис', correct: 1, question: questions[2] },
                          { body: 'True/False', correct: 0, question: questions[2] },
                          { body: 'Классы', correct: 0, question: questions[3] },
                          { body: 'Блоки', correct: 1, question: questions[3] }
                        ])
