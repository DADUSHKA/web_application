module TrophiesHelper

  def number_trophy(precept)
    if current_user.trophies.where(precept: precept).blank?
      "Не заслужили"
    else
      current_user.trophies.where(precept: precept).count
    end
  end

end
