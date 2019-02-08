# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Welcome respected, #{current_user.first_name}!" if is_flashing_format?
  end
end
