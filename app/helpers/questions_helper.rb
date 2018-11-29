module QuestionsHelper

  def question_header(instance)
    Test.question_header(instance.id).title if instance.persisted?
  end

end
