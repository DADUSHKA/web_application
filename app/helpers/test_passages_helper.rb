# frozen_string_literal: true

module TestPassagesHelper
  def success_rate(object_1, object_2)
    all_count_answers_correct = 0
    user_count_answers_correct = object_2
    object_1.questions.each do |i|
      all_count_answers_correct += i.answers.correct.count
    end
    ((100.0 / all_count_answers_correct) * user_count_answers_correct).to_i
  end

  def selection(object_1, object_2, str_1, str_2)
    if success_rate(object_1, object_2) >= 85
      str_1
    else
      str_2
    end
  end

  def selection_message(object_1, object_2)
    selection(object_1, object_2, "The  #{@test_passage.test.title} Test was Completed.",
              "The  #{@test_passage.test.title} Test no Completed.")
  end

  def selection_style(object_1, object_2)
    selection(object_1, object_2, 'green', 'red')
  end
end
