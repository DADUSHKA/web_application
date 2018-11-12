module TestsHelper
  TEST_LEVELS = { 0 => 'easy', 1 => 'elementary', 2 => 'advanced', 3 => 'hard' }.freeze

  def level_test(test)
    TEST_LEVELS[test.level] || :hero
  end

  def question_header(instance)
    Test.question_header(instance.id).title
  end

  def all_test_questions(instance)
    var = []
    instance.questions.each do |resource|
      var << resource.description
    end
    var
  end

end
