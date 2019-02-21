class DistributionTrophies
  TEST_THRESHOLD = 85

  def initialize(test_passage, current_user_test_passages)
    @test_passage = test_passage
    @current_user_test_passages = current_user_test_passages
    @results = []
  end

  def successful_completion_tests_from_category(trophies)
    if @test_passage.count_tests_category_test_passages_all(@current_user_test_passages) ==
     @test_passage.count_tests_category_test_passages_traversed(@current_user_test_passages) &&
     @test_passage.success_rate >= TEST_THRESHOLD
     trophies.find_by(precept: 'Category')
    end
  end

  def successful_completion_tests_certain_level(trophies)
    if @test_passage.count_tests_level_test_passages_all(@current_user_test_passages) ==
     @test_passage.count_tests_level_test_passages_traversed(@current_user_test_passages) &&
     @test_passage.success_rate >= TEST_THRESHOLD
     trophies.find_by(precept: 'Level')
    end
  end

  def successful_completion_test_first_attempt(trophies)
   if (@test_passage.success_rate >= TEST_THRESHOLD &&
    @current_user_test_passages.where(test_id: @current_user_test_passages.last.test_id).count == 1)
    trophies.find_by(precept: 'Speed')
   end
  end

end
