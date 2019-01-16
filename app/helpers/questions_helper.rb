module QuestionsHelper
  def question_header(instance)
    if instance.new_record?
      t('.header_create', title: @test.title)
    else
      t('.header_edit', title: instance.test.title)
    end
  end
end
