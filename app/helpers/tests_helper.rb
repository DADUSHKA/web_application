module TestsHelper
  TEST_LEVELS = { 0 => 'easy', 1 => 'elementary', 2 => 'advanced', 3 => 'hard' }.freeze

  def level_test(test)
    TEST_LEVELS[test.level] || :hero
  end

  # def all_test_questions(test)
  #   test.questions.pluck(:description)
  # end

end
