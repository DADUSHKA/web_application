# frozen_string_literal: true

class SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = "Welcome back, #{current_user.first_name}!" if is_flashing_format?
  end

end
