class TrophiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trophies = current_user.trophies
  end
end
