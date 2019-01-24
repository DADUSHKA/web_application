class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def gist
      result = GistQuestionService.new(@test_passage.question).call
      Gist.new.entry_in_the_table(@test_passage.question.description,
                                  result[:files][:test_guru_question_test][:raw_url], current_user.id)
      flash[:notice] = if result.success?
        'An error occurred while creating Gist'
                       else
       "Gist created. #{view_context.link_to('Click this link',
                                             (result[:git_pull_url]).to_s, target: :_blank)}"
                       end
      redirect_to @test_passage
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
