module UsersHelper
  def first_name
    current_user.first_name
  end

  def last_name
    current_user.last_name
  end
end
