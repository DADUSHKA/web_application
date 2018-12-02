class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_test, only: [:new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_path(@test), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to tests_path, notice: 'Question was successfully destroyed.'
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
    render plain: "The question is not in the database."
  end

end
