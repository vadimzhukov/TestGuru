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
                               { title: 'History' },
                               { title: 'Politic' }
                             ])

tests = Test.create([
                      { title: 'Star Wars', level: 3, category: categories[0], author: user1, timer: 300 },
                      { title: 'Short test', level: 0, category: categories[4], author: user1, timer: 3 },
                      { title: 'Short test2', level: 0, category: categories[3], author: user1, timer: 4 }
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
                              { body: 'Какого цвета рука C3PO в Star Wars: пробуждение Силы?', test: tests[0] },
                              { body: 'Просто выберите Правильный ответ', test: tests[1] },
                              { body: 'Просто выберите Правильный ответ', test: tests[2] }
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
                          { body: 'Золотистая', correct: 0, question: questions[14] },
                          # Просто выберите Правильный ответ
                          { body: 'Правильный ответ', correct: 1, question: questions[15] },
                          { body: 'Неправильный ответ', correct: 0, question: questions[15] },
                           # Просто выберите Правильный ответ
                           { body: 'Правильный ответ', correct: 1, question: questions[16] },
                           { body: 'Неправильный ответ', correct: 0, question: questions[16] }

                        ])

tests[1].update_attribute(:published, true)
tests[2].update_attribute(:published, true)

rules = Rule.create([
                    {title: "current_test_tries_equal?", parameters: "[tries]"},
                    {title: "current_test_successful_passes_equal?", parameters: "[tries]"},
                    {title: "result_percent_between?", parameters: "[percent_min, percent_max]"},
                    {title: "badge_existed?", parameters: "[badge_name]"},
                    {title: "all_tests_passed?"},
                    {title: "all_tests_of_categories_passed_successfully?", parameters: "[category_ids]"},
                    {title: "tests_of_all_categories_passed_successfully_except_current?", parameters: ""},
                    {title: "categories_at_least_once_passed?", parameters: "[category_ids]"},
                    {title: "all_categories_passed_at_least_once_except?", parameters: "[category_ids]"},
                    {title: "all_tests_of_levels_passed_successfully?", parameters: "[levels]"},
                    {title: "tests_of_all_levels_passed_successfully_except?", parameters: "[levels]"}
])

badges = Badge.create([
                      { title: 'First try success',  description: "The test was passed successfully on the first try" },
                      { title: 'Cool', description: "More than 90% of right answers in test passage" },
                      { title: 'Wibe', description: "More than 100% right answers in test passage" },
                      { title: 'Ninja', description: "At least one successful test in each category" },
                      { title: 'Politic guru', description: "Successfully passed all political tests" },
                      { title: '0 level guru', description: "Successfully passed all political tests" },
                      { title: 'Guru', description: "Successfuly passed all the tests of all categories" }
])

badges[0].image.attach(io: File.open(File.join(Rails.root,'app/assets/images/badges/pie.jpg')), filename: 'pie.jpg')
badges[1].image.attach(io: File.open(File.join(Rails.root,'app/assets/images/badges/cool.jpg')), filename: 'cool.jpg')
badges[2].image.attach(io: File.open(File.join(Rails.root,'app/assets/images/badges/wibe.jpg')), filename: 'wibe.jpg')
badges[3].image.attach(io: File.open(File.join(Rails.root,'app/assets/images/badges/globe.jpg')), filename: 'globe.jpg')
badges[4].image.attach(io: File.open(File.join(Rails.root,'app/assets/images/badges/ghost.jpg')), filename: 'ghost.jpg')
badges[5].image.attach(io: File.open(File.join(Rails.root,'app/assets/images/badges/skull.jpg')), filename: 'skull.jpg')
badges[6].image.attach(io: File.open(File.join(Rails.root,'app/assets/images/badges/owl.jpg')), filename: 'owl.jpg')

badge_rules = BadgeRule.create([
                                {badge_id: badges[0].id, rule_id: rules[0].id, parameters_thresholds: '{"tries": "1"}'},
                                {badge_id: badges[0].id, rule_id: rules[1].id, parameters_thresholds: '{"tries": "1"}'},

                                {badge_id: badges[1].id, rule_id: rules[2].id, parameters_thresholds: '{"percent_min": "90", "percent_max": "99"}'},

                                {badge_id: badges[2].id, rule_id: rules[2].id, parameters_thresholds: '{"percent_min": "100", "percent_max": "100"}'},

                                {badge_id: badges[3].id, rule_id: rules[6].id},
                                {badge_id: badges[3].id, rule_id: rules[1].id, parameters_thresholds: '{"tries": "1"}'},

                                {badge_id: badges[4].id, rule_id: rules[5].id, parameters_thresholds: '{"category_ids": "5"}'},
                                {badge_id: badges[4].id, rule_id: rules[1].id, parameters_thresholds: '{"tries": "1"}'},

                                {badge_id: badges[5].id, rule_id: rules[9].id, parameters_thresholds: '{"levels": "0"}'},
                                {badge_id: badges[5].id, rule_id: rules[1].id, parameters_thresholds: '{"tries": "1"}'},

                                {badge_id: badges[6].id, rule_id: rules[4].id},
                                {badge_id: badges[6].id, rule_id: rules[1].id, parameters_thresholds: '{"tries": "1"}'}

])