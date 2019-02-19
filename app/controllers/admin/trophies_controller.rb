class Admin::TrophiesController < ApplicationController
  before_action :set_trophy, only: %i[show edit update destroy]

  def index
    @trophies = Trophy.all
  end

  def edit; end

  def update
    if @trophy.update(trophy_params)
      redirect_to admin_trophy_path(@trophy), notice: t('.success')
    else
      render :edit
    end
  end

  def show; end

  def new
    @trophy = Trophy.new
  end

  def create
    @trophy = Trophy.new(trophy_params)
    if @trophy.save
      redirect_to admin_trophy_path(@trophy), notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @trophy.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

  private

  def set_trophy
    @trophy = Trophy.find(params[:id])
  end

  def trophy_params
    params.require(:trophy).permit(:title, :image, :precept)
  end
end
