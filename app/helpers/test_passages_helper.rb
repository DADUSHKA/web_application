module TestPassagesHelper
  TEST_THRESHOLD = 85

  def result_message(test_passage)
    if test_passage.success_rate >= TEST_THRESHOLD
      t('.header_was', title: test_passage.test.title)
    else
      t('.header_no', title: test_passage.test.title)
    end
  end

  def selection_style(test_passage)
    if test_passage.success_rate >= TEST_THRESHOLD
      'green'
    else
      'red'
    end
  end

  def results_of_the_trophies(test_passage, current_user_test_passages)
    successful_completion_tests_from_category(test_passage, current_user_test_passages)
    successful_completion_tests_certain_level(test_passage, current_user_test_passages)
    successful_completion_test_first_attempt(test_passage, current_user_test_passages)
  end

  def successful_completion_tests_from_category(test_passage, user_test_passages)
    if test_passage.count_tests_category_test_passages_all(user_test_passages) ==
       test_passage.count_tests_category_test_passages_traversed(user_test_passages) &&
       test_passage.success_rate >= TEST_THRESHOLD
      @trophy1 = @trohphies.find_by(precept: 'Category')
    end
  end

  def successful_completion_tests_certain_level(test_passage, user_test_passages)
    if test_passage.count_tests_level_test_passages_all(user_test_passages) ==
       test_passage.count_tests_level_test_passages_traversed(user_test_passages) &&
       test_passage.success_rate >= TEST_THRESHOLD
      @trophy2 = @trohphies.find_by(precept: 'Level')
    end
  end

  def successful_completion_test_first_attempt(test_passage, user_test_passages)
    if test_passage.success_rate >= TEST_THRESHOLD &&
       user_test_passages.where(test_id: user_test_passages.last.test_id).count == 1
     @trophy3 = @trohphies.find_by(precept: 'Speed')
   end
 end
end
