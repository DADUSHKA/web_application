module QuestionsHelper

  def question_header(instance)
    if instance.new_record?
      "Create New #{@test.title} Question"
    else
      "Editing #{instance.test.title}  Question"
    end
  end

end
