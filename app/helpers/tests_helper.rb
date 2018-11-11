module TestsHelper
  TEST_LEVELS = { 0 => 'easy', 1 => 'elementary', 2 => 'advanced', 3 => 'hard' }.freeze

  def level_test(test)
    TEST_LEVELS[test.level] || :hero
  end

  def question_header(value)
    Test.question_head(value)
  end

  def total_questions(test_title)
    var = []
    Question.by_test(test_title).each do |resource|
      var << resource.description
    end
    var.join(' , ')
  end

  def user_name(value)
    User.user_on_test(value.author_id).name
  end

  def category_name(value)
    Category.category_on_test(value.category_id).title
  end

end
