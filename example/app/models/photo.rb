class Photo < ActiveResource::Base
  self.site = "http://yachtlayoutsrus.ath.cx"

  def self.find_by_specification(specification_id)
    return Photo.find(:all, :from=>"/specifications/#{specification_id}/photos.xml")
  end

  def self.find_by_id_and_specification(id, specification_id)
    pic = Photo.find(:one, :from=>"/specifications/#{specification_id}/photos/#{id}.xml")
  end
end
