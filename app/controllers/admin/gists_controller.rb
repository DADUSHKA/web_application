class Admin::GistsController < ApplicationController
  def index
    @gists = Gist.all
  end

  def destroy
    @gist = Gist.find(params[:id])
    @gist.destroy
    redirect_to admin_gists_path, notice: t('.successes')
  end
end
