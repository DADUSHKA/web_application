module QuestionsHelper

  def question_header(instance)
    Test.find(instance.id).title if instance.persisted?
  end

end
