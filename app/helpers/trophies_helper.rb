module TrophiesHelper

  def title_trophies(precept)
    if  @trophies.find_by(precept: precept).blank?
     "Не заслужили"
    else
      @trophies.find_by(precept: precept).title
    end
  end

  def showing_well_deserved_image(precept)
    if @trophies.find_by(precept: precept).blank?
      "Не заслужили"
    else
      image_tag( @trophies.find_by(precept: precept).image)
    end
  end

  def number_trophies(precept)
    @trophies.where(precept: precept).count
  end

end
