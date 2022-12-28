class RewardService
  # 1. На вхоод получаю: test_passage, user, test, result_percent

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @result_percent = 100 * (test_passage.correct_answers_count.to_f / test_passage.test.questions.count)
    @current_category_id = @test.category_id
    @current_level = @test.level
  end

  def call
    if @test_passage.successfully
      badges = check_for_rewards
      badges.each do |b|
        UserBadge.create(user_id: @user.id, badge_id: b.id, test_passage_id: @test_passage.id)
      end
    end
  end

  private

  # 2. Выяснем текущий прогресс пользователя до подведения итогов test_passage (только по опубликованным тестам):
  #   2.1. Количество попыток прохождения данного теста
  #   2.2. Категория данного теста
  #   2.3. Количество категорий тестов - это условно константа, можно в инициализацию
  #   2.3. Количество уровней тестов - это условно константа, можно в инициализацию
  #   2.2. Уровень данного теста
  #   2.5. Сколько тестов в каждой категории и сколько из них пройдено успешно (кроме данного теста)
  #   2.7. Сколько тестов в каждом уровне и сколько из них пройдено успешно (кроме данного теста)

  def user_state
    state = {}
    state[:current_test_tries] = @user.test_passages.where('test_id = ?', @test.id).count

    state[:current_test_successful_passes] =
      @user.test_passages.where('test_id = ? and successfully = ?', @test.id, true).count

    state[:tests_categories] = Category.find(Test.published.pluck('category_id').uniq)

    # stats of total tests counts and successfully passed by the user tests count in each category
    categories_stat = {}
    state[:tests_categories].each do |cat|
      tests_in_category = Test.published.where('category_id = ?', cat.id)
      successful_tests_in_category = tests_in_category.reject do |t|
        t.test_passages.where('user_id = ? and successfully = ?', @user.id, true).count == 0
      end
      categories_stat.merge!(cat.id => { total_tests: tests_in_category.count,
                                         successful_tests: successful_tests_in_category.count })
    end

    state[:categories_stat] = categories_stat

    state[:tests_levels] = Test.published.pluck('level').uniq

    # stats of total tests counts and successfully passed by the user tests count of each level
    levels_stat = {}
    state[:tests_levels].each do |level|
      tests_of_level = Test.published.where('level = ?', level)
      successful_tests_of_level = tests_of_level.reject do |t|
        t.test_passages.where('user_id = ? and successfully = ?', @user.id, true).count == 0
      end
      levels_stat.merge!(level => { total_tests: tests_of_level.count,
                                    successful_tests: successful_tests_of_level.count })
    end

    state[:levels_stat] = levels_stat

    state
  end

  def current_test_passed_first_time?
    user_state[:current_test_successful_passes] == 1
  end

  # 3. Раздаем бейджи согласно бизнес логике:

  def check_for_rewards
    result = []
    result << first_try_success_reward if first_try_success_reward.present?
    result << cool_reward if cool_reward.present? && !wibe_reward.present?
    result << wibe_reward if wibe_reward.present?
    result << ninja_reward if ninja_reward.present?
    result << category_guru_reward if category_guru_reward.present?
    result << level_guru_reward if level_guru_reward.present?
    result << guru_reward if guru_reward.present?
    result
  end

  def first_try_success_reward
    #   1. First try success
    #   Успешное прохождение данного теста с первой попытки
    #   - [ ] данный тест успешно пройден
    #   - [ ] Попыток прохождения данного теста == 1
    if user_state[:current_test_successful_passes] == 1 && user_state[:current_test_tries] == 1
      Badge.find_by(title: 'First try success')
    end
  end

  def cool_reward
    # 2. Cool
    # Более 90% правильных ответов при прохождении данного теста
    # - [ ] данный тест успешно пройден
    # - [ ] результат прохождения >= 90%
    Badge.find_by(title: 'Cool') if @result_percent >= 90 && user_state[:current_test_successful_passes] == 1
  end

  def wibe_reward
    # 3. Wibe
    # 100% правильных ответов при прохождении данного теста
    # - [ ] данный тест успешно пройден
    # - [ ] результат прохождения = 100%
    Badge.find_by(title: 'Wibe') if @result_percent == 100 && user_state[:current_test_successful_passes] == 1
  end

  def ninja_reward
    # 4. Ninja
    # Пройден успешно как минимум 1 тест из каждой категории

    # - [ ] данный тест успешно пройден
    # - [ ] есть успешно пройденные тесты во всех остальных категориях
    # - [ ] это первое успешное прохождение в данной категории
    all_except_current_categories_passed = user_state[:categories_stat].except(@current_category_id).reduce(true) do |acc, cat|
      acc && (cat[1][:total_tests] == cat[1][:successful_tests])
    end

    Badge.find_by(title: 'Ninja') if all_except_current_categories_passed && current_test_passed_first_time?
  end

  def category_guru_reward
    # 5. <Category> guru
    # Успешно пройдены все тесты категории <Politica>

    # - [ ] данный тест успешно пройден
    # - [ ] Количество успешно пройденных тестов в данной категории = 100%
    total_of_category = user_state[:categories_stat][@current_category_id][:total_tests]
    success_in_category = user_state[:categories_stat][@current_category_id][:successful_tests]
    category_badge = Badge.find_by(title: "#{Category.find(@current_category_id).title} guru")

    category_badge if total_of_category == success_in_category && category_badge && current_test_passed_first_time?
  end

  def level_guru_reward
    # 6. <Level> guru
    # Успешно пройдены все тесты данного уровня сложности
    # - [ ] данный тест успешно пройден
    # - [ ] Количество успешно пройденных тестов данного уровня = 100%
    total_of_level = user_state[:levels_stat][@current_level][:total_tests]
    success_in_level = user_state[:levels_stat][@current_level][:successful_tests]
    level_badge = Badge.find_by(title: "Level #{@current_level} guru")

    level_badge if total_of_level == success_in_level && level_badge && current_test_passed_first_time?
  end

  def guru_reward
    # 7. Guru
    # Успешно пройдены все тесты во всех категориях
    # - [ ] данный тест успешно пройден
    # - [ ] Все тесты успешно пройдены
    total_tests_count = user_state[:categories_stat].reduce(0) { |sum, cat| sum + cat[1][:total_tests] }
    successful_tests_count = user_state[:categories_stat].reduce(0) { |sum, cat| sum + cat[1][:successful_tests] }

    Badge.find_by(title: 'Guru') if total_tests_count == successful_tests_count && current_test_passed_first_time?
  end
end
