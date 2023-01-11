class RulesService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end


  def call(check_method, parameters)
    if parameters 
      params = JSON.parse(parameters).symbolize_keys 
    else
      params = {}
    end

    method(check_method.to_sym).call(params)
  end

  private

  # Methods for rules

  def current_test_tries_equal?(options = {})
    @test_passage.user.test_passages.where(test_id: @test.id).count == options.fetch(:tries).to_i
  end

  def current_test_successful_passes_equal?(options = {})
    @test_passage.user.test_passages.where(test_id: @test.id,successfully: true).count == options.fetch(:tries).to_i
  end

  def result_percent_between?(options = {})
    current_percent = (100 * (@test_passage.correct_answers_count.to_f / @test_passage.test.questions.count))
    current_percent >= options.fetch(:percent_min).to_f && current_percent <= options.fetch(:percent_max).to_f
  end

  def all_tests_passed?(options = {})
    Test.published.count == @user.test_passages.where(successfully: true).pluck('test_id').uniq.count
  end

  # CATEGORY RULES
  def all_tests_of_categories_passed_successfully?(options = {})
    result = true
    options.fetch(:category_ids).split(', ').each do |category|
      result &&= tests_in_category(category) == successfully_passed_tests_in_category(category)
    end
    result
  end

  def tests_of_all_categories_passed_successfully_except_current?(options = {})
    categories = categories_with_published_tests.excluding(@test_passage.test.category_id)
    all_tests_of_categories_passed_successfully?({category_ids: categories})
  end

  def all_categories_passed_at_least_once_except?(options = {})
    categories = categories_with_published_tests.excluding(options.fetch(:category_ids).split(', '))
    categories_at_least_once_passed?(categories)
  end

  # LEVEL RULES

  def tests_of_all_levels_passed_successfully_except?(options = {})
    passed_levels = levels_with_published_tests.excluding(options.fetch(:levels).split(', '))
    all_tests_of_levels_passed_successfully?(passed_levels)
  end

  # Help Methods - not for rules

  def tests_in_category(category_id)
    Test.published.where(category_id: category_id)
  end

  def successfully_passed_tests_in_category(category_id)
    tests_in_category(category_id).reject do |t|
      t.test_passages.where(user_id: @user.id, successfully: true)
    end
  end

  def tests_of_level(level)
    Test.published.where(level: level)
  end

  def successfully_passed_tests_of_level(level)
    tests_of_level(level).reject do |t|
      t.test_passages.where(user_id: @user.id, successfully: true)
    end
  end

  def categories_with_published_tests
    Test.published.pluck('category_id')
  end

  def levels_with_published_tests
    Test.published.pluck('level')
  end

  def categories_at_least_once_passed?(category_ids)
    result = true
    category_ids.each do |category|
      result &&= (successfully_passed_tests_in_category(category) > 0)
    end
    result
  end

  def all_tests_of_levels_passed_successfully?(levels)
    result = true
    levels.each do |level|
      result &&= tests_of_level(level) == successfully_passed_tests_of_level(level)
    end
    result
  end
end
