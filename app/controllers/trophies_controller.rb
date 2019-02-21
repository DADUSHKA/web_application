class TrophiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trophies = Trophy.all
  end
end
