class Specification < ActiveResource::Base
  self.site = "http://yachtlayoutsrus.ath.cx"

  def photos
    Photo.find_by_specification(id)
  end

  def to_s
    "#{length} #{manufacturer} #{model}"
  end
end
