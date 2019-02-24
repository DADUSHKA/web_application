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

end
