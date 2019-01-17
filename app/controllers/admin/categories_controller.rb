class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to admin_category_path(@category), notice: t('.success')
    else
      render :edit
    end
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_category_path(@category), notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to tests_path, notice: t('.success')
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
