class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Question was successfully destroyed.'
  end


  private


  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_from_test_not_found
    render plain: "The test is not in the database."
  end

end
