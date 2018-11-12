module TestsHelper
  TEST_LEVELS = { 0 => 'easy', 1 => 'elementary', 2 => 'advanced', 3 => 'hard' }.freeze

  def level_test(test)
    TEST_LEVELS[test.level] || :hero
  end

  def question_header(instance_id)
    Test.question_header(instance_id).title
  end

  def total_questions
    var = []
    @test.questions.each do |resource|
      var << resource.description
    end
    var.join(' , ')
  end

end
