class Admin::TestsController < Admin::AdminController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy start update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index;  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    @test.author_id = current_user.id
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.successes')
    else
      render :new, notice: t('.misstake')
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('.successes')
    else
      render :edit, notice: t('.misstake')
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.successes')
    else
      render :index, notice: t('.misstake')
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.successes')
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_from_test_not_found
    render plain: 'The test is not in the database.'
  end
end
