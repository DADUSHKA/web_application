class DistributionTrophies
  TEST_THRESHOLD = 85

  def initialize(test_passage, user_test_passages)
    @test_passage = test_passage
    @user_test_passages = user_test_passages
  end

  def call
   trophies = []
   Trophy.all.each do |trophy|
      trophies.push(trophy) if option_trophy_level(trophy) ||
      option_trophy_category(trophy) ||
      option_trophy_first_attempt(trophy)
    end
      user_trophues(trophies)
      trophies
  end


private


  def user_trophues(deserved_trophy)
    deserved_trophy.each do |trophy|
      @test_passage.user.trophies.push(trophy)
    end
  end

  def option_trophy_level(trophy)
    trophy.precept == 'Level' if successful_completion_tests_certain_level_rule?
  end

  def option_trophy_category(trophy)
    trophy.precept == 'Category' if successful_completion_tests_from_category_rule?
  end

  def option_trophy_first_attempt(trophy)
    trophy.precept == 'Speed' if successful_completion_test_first_attempt_rule?
  end

  def successful_completion_tests_from_category_rule?
    count_tests_category_test_passages_all ==
    count_tests_category_test_passages_traversed &&
    @test_passage.success_rate >= TEST_THRESHOLD
  end

  def successful_completion_tests_certain_level_rule?
    count_tests_level_test_passages_all ==
    count_tests_level_test_passages_traversed &&
    @test_passage.success_rate >= TEST_THRESHOLD
  end

  def successful_completion_test_first_attempt_rule?
    (@test_passage.success_rate >= TEST_THRESHOLD &&
    @user_test_passages.where(test_id: @user_test_passages.last.test_id).count == 1)
  end


  def count_tests_category_test_passages_all
    Test.by_category(@user_test_passages.last.test.category.title).count
  end

  def count_tests_category_test_passages_traversed
    Test.where(test_passages: @user_test_passages)
    .by_category(@user_test_passages.last.test.category.title).count
  end

  def count_tests_level_test_passages_all
    Test.by_level(@user_test_passages.last.test.level).count
  end

  def count_tests_level_test_passages_traversed
    Test.where(test_passages: @user_test_passages)
    .where(level: @user_test_passages.last.test.level).count
  end

end
