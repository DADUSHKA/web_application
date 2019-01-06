class SessionsController < ApplicationController
  def new;end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      log_in user
      redirect_back_or tests_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

end
