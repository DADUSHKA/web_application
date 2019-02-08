class Admin::QuestionsController < Admin::AdminController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :set_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path, notice: t('.successes')
    else
      render :edit
    end
  end

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path(@test), notice: t('.successes')
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@test), notice: t('.successes')
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:description, :test_id)
  end

  def rescue_from_question_not_found
    render plain: 'The question is not in the database.'
  end
end
