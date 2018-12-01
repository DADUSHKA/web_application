module QuestionsHelper

  def question_header(instance)
     if instance.new_record?
      Test.find(@test.id).title
     else
      render plain: "The object is in the database."
     end
  end

end
