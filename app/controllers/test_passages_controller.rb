class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result
   @trophies_issued = DistributionTrophies.new(@test_passage, @test_passage.user, current_user.test_passages)
   @trophies = Trophy.all
  end

  def gist
    result = GistQuestionService.new(@test_passage.question).call
    flash[:notice] = if result.empty?
      t('.failure')
    else
      t('.success', title: " #{view_context.link_to('Click this link',
        (result[:git_pull_url]).to_s, target: :_blank)}")
    end

    current_user.gists.create(question_id: @test_passage.question.id,
    gist_url: result[:files][:test_guru_question_test][:raw_url],
    user_id: current_user.id)

    redirect_to @test_passage
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.timeout?
      redirect_to result_test_passage_path(@test_passage)
      flash[:notice] = "You failed the test, #{current_user.first_name}!"
      return
    end

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

