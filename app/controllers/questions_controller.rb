class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_test, only: [:new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def index
    @questions = Question.all
  end

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

    render inlain: "<h1><%= @question.description  %></h1> \n
      <p><%= link_to 'Back', test_questions_path(:test) %></p> ".html_safe

  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_questions_path(@test), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test), notice: 'Question was successfully destroyed.'
  end


  private


  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:description)
  end

  def rescue_from_question_not_found
    render plain: "The question is not in the database."
  end

end
