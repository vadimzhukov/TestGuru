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

user1 = User.new(name: 'Vadim', last_name: 'Zhukov', email: 'admin@testguru.com', password: 'No_password',
                 password_confirmation: 'No_password', type: 'Admin')
user1.skip_confirmation!
user1.save!

user2 = User.new(name: 'Sergey', last_name: 'Segeev', email: 'user@testguru.com', password: '123456',
                 password_confirmation: '123456', type: 'User')
user2.skip_confirmation!
user2.save!

categories = Category.create([
                               { title: 'Movies' },
                               { title: 'SW Development' },
                               { title: 'Geography' },
                               { title: 'History' }
                             ])

tests = Test.create([
                      { title: 'Star Wars', level: 0, category: categories[0], author: user1 }

                    ])

questions = Question.create([
                              { body: 'Что случилось с Энакином Скайуокером во время битвы с графом Дуку?',
                                test: tests[0] },
                              { body: 'Кто играл роль командира Коди?',
                                test: tests[0] },
                              { body: 'Что Люк Скайуокер потерял в битве с Дартом Вейдером?', test: tests[0] },
                              { body: 'По словам Императора, в чем заключалась слабость Люка Скайуокера?',
                                test: tests[0] },
                              { body: 'Где начались Войны клонов?', test: tests[0] },
                              {
                                body: 'В каком фильме из «Звездных войн» есть такая цитата: «Я участвовал в этой битве с шести лет!»', test: tests[0]
                              },
                              {
                                body: 'Чем Джа Джа Бинкс в конечном итоге обязан Куай-Гону Джинну после того, как тот же спас его во время вторжения на Набу?', test: tests[0]
                              },
                              { body: 'Что Оуэн Ларс рассказал Люку Скайуокеру о своем отце?', test: tests[0] },
                              { body: 'Кто сказал эту цитату: «Я предпочитаю жить для своего народа»?',
                                test: tests[0] },
                              { body: 'Какое оружие предпочитает Чубакка?', test: tests[0] },
                              {
                                body: 'Как зовут лорда ситхов с рогатой головой, держащего крутой световой меч с двумя лезвиями?', test: tests[0]
                              },
                              {
                                body: 'Cколько лет Чубакке когда мы снова видим его в «Пробуждении силы», после многих лет блуждания по галактике с Ханом Соло?', test: tests[0]
                              },
                              { body: 'В каком фильме из «Звездных войн» есть такая цитата: «Я не люблю песок»?',
                                test: tests[0] },
                              {
                                body: 'Какие существа, живущие на Эндоре, помогли повстанцам победить вторую Звезду Смерти?', test: tests[0]
                              },
                              { body: 'Какого цвета рука C3PO в Star Wars: пробуждение Силы?', test: tests[0] }
                            ])

answers = Answer.create([
                          # Что случилось с Энакином Скайуокером во время битвы с графом Дуку?
                          { body: 'Он потерял левую ногу', correct: 0, question: questions[0] },
                          { body: 'Он потерял правую руку', correct: 1, question: questions[0] },
                          { body: 'Он потерял правую ногу', correct: 0, question: questions[0] },
                          { body: 'Он не потерял конечностей', correct: 0, question: questions[0] },
                          # Кто играл роль командира Коди?
                          { body: 'Джей Лагайя', correct: 0, question: questions[1] },
                          { body: 'Темуэра Моррисон', correct: 1, question: questions[1] },
                          { body: 'Ахмед Бест', correct: 0, question: questions[1] },
                          { body: 'Джоэл Эдгертон', correct: 0, question: questions[1] },
                          # Что Люк Скайуокер потерял в битве с Дартом Вейдером?
                          { body: 'Левую руку', correct: 0, question: questions[2] },
                          { body: 'Левую ногу', correct: 0, question: questions[2] },
                          { body: 'Правую руку', correct: 1, question: questions[2] },
                          { body: 'Правую ногу', correct: 0, question: questions[2] },
                          # По словам Императора, в чем заключалась слабость Люка Скайуокера?
                          { body: 'Его вера в светлую сторону силы', correct: 0, question: questions[3] },
                          { body: 'Его вера в своих друзей', correct: 1, question: questions[3] },
                          { body: 'Его отсутствие видения', correct: 0, question: questions[3] },
                          { body: 'Его сопротивление Темной стороне Силы', correct: 0, question: questions[3] },
                          # Где начались Войны клонов?
                          { body: 'Татуин', correct: 0, question: questions[4] },
                          { body: 'Джеонозис', correct: 1, question: questions[4] },
                          { body: 'Набу', correct: 0, question: questions[4] },
                          { body: 'Корусант', correct: 0, question: questions[4] },
                          # В каком фильме из «Звездных войн» есть такая цитата: «Я участвовал в этой битве с шести лет!»
                          { body: 'Звездные войны: новая надежда', correct: 0, question: questions[5] },
                          { body: 'Звездные войны: Восхождение Скайуокера', correct: 0, question: questions[5] },
                          { body: 'Изгой один: Star Wars история', correct: 1, question: questions[5] },
                          { body: 'Соло: история звездных войн', correct: 0, question: questions[5] },
                          # Чем Джар Джар Бинкс в конечном итоге обязан Куай-Гону Джинну после того, как тот же спас его во время вторжения на Набу?
                          { body: 'Поездка в Ото Гунга', correct: 0, question: questions[6] },
                          { body: 'Бонго', correct: 0, question: questions[6] },
                          { body: 'Долг чести', correct: 1, question: questions[6] },
                          { body: '9,000 кредитов', correct: 0, question: questions[6] },
                          # Что Оуэн Ларс рассказал Люку Скайуокеру о своем отце?
                          { body: 'Он был штурманом на грузовом судне специй', correct: 1, question: questions[7] },
                          { body: 'Он был рыцарем-джедаем', correct: 0, question: questions[7] },
                          { body: 'Он был лордом ситхов', correct: 0, question: questions[7] },
                          { body: 'Он был летчиком-истребителем', correct: 0, question: questions[7] },
                          # Кто сказал эту цитату: «Я предпочитаю жить для своего народа»?
                          { body: 'Падме Амидала', correct: 0, question: questions[8] },
                          { body: 'Риё Чучи', correct: 1, question: questions[8] },
                          { body: 'Королева Джамилия', correct: 0, question: questions[8] },
                          { body: 'Гера Синдулла', correct: 0, question: questions[8] },
                          # Какое оружие предпочитает Чубакка?
                          { body: 'Бластерная винтовка', correct: 0, question: questions[9] },
                          { body: 'Лазерный меч', correct: 0, question: questions[9] },
                          { body: 'Металлическая дубина', correct: 0, question: questions[9] },
                          { body: 'Боукастер', correct: 1, question: questions[9] },
                          # Как зовут лорда ситхов с остроконечной головой, держащего крутой световой меч с двумя лезвиями?
                          { body: 'Дарт Вейдер', correct: 0, question: questions[10] },
                          { body: 'Дарт Мол', correct: 1, question: questions[10] },
                          { body: 'Дарт Пол', correct: 0, question: questions[10] },
                          { body: 'Дарт Гарт', correct: 0, question: questions[10] },
                          # Cколько лет Чубакке когда мы снова видим его в «Пробуждении силы», после многих лет блуждания по галактике с Ханом Соло?
                          { body: 'Около 55', correct: 0, question: questions[11] },
                          { body: '78', correct: 0, question: questions[11] },
                          { body: 'Ровно 200', correct: 0, question: questions[11] },
                          { body: 'Более 220', correct: 1, question: questions[11] },
                          # В каком фильме из «Звездных войн» есть такая цитата: «Я не люблю песок»?
                          { body: 'Звездные войны: новая надежда', correct: 0, question: questions[12] },
                          { body: 'Звездные войны: атака клонов', correct: 1, question: questions[12] },
                          { body: 'Звездные войны: пробуждение силы', correct: 0, question: questions[12] },
                          { body: 'Звездные войны: Скайуокер восход', correct: 0, question: questions[12] },
                          # Какие существа, живущие на Эндоре, помогли повстанцам победить вторую Звезду Смерти?
                          { body: 'Эвоки', correct: 1, question: questions[13] },
                          { body: 'Вуки', correct: 0, question: questions[13] },
                          { body: 'Нерф Хердерс', correct: 0, question: questions[13] },
                          { body: 'Джавы', correct: 0, question: questions[13] },
                          # Какого цвета рука C3PO в Star Wars: The Force Awakens?
                          { body: 'Черная', correct: 0, question: questions[14] },
                          { body: 'Красная', correct: 1, question: questions[14] },
                          { body: 'Серебристая', correct: 0, question: questions[14] },
                          { body: 'Золотистая', correct: 0, question: questions[14] }
                        ])
