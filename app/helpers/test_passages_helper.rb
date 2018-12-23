# frozen_string_literal: true

module TestPassagesHelper

  TEST_THRESHOLD = 85

  def result_message(test_passage)
    if test_passage.success_rate >= TEST_THRESHOLD
      "The  #{@test_passage.test.title} Test was Completed."
    else
      "The  #{@test_passage.test.title} Test no Completed."
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
