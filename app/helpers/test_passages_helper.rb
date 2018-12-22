# frozen_string_literal: true

module TestPassagesHelper

  TEST_THRESHOLD = 85

  def result_message
    selection("The  #{@test_passage.test.title} Test was Completed.",
              "The  #{@test_passage.test.title} Test no Completed.")
  end

  def selection_style
    selection('green', 'red')
  end

  private

  def selection(str_1, str_2)
    if @test_passage.success_rate >= TEST_THRESHOLD
      str_1
    else
      str_2
    end
  end

end
