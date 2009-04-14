# Implements LL API
module ApiHelper

  # TODO generalize this into accepting conditions
  def specifications_get # options
    specifications = Specification.find_by_sql(["SELECT * FROM specifications ORDER BY manufacturer, length DESC"])
    specifications.to_xml(:thumb=>true)
  end

  def specification_get(id)
    specification = Specification.find(id)
  end

  def specification_photos_get(id)
    photos = Specification.find(id).photos
    photos.to_xml(:thumb=>true)
  end

  def specification_photo_get(spec_id, photo_id)
    photo = Specification.find(spec_id).photos.find(photo_id)
  end

end
