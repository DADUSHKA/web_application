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

  def trophy_category(trophies_issued, trophies)
    trophies_issued.successful_completion_tests_from_category(trophies)
  end

  def trophy_level(trophies_issued, trophies)
    trophies_issued.successful_completion_tests_certain_level(trophies)
  end

  def trophy_speed(trophies_issued, trophies)
    trophies_issued.successful_completion_test_first_attempt(trophies)
  end

end
