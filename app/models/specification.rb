class Specification < ActiveRecord::Base
  has_many :photos, :dependent=>:destroy

  validates_numericality_of :length, :year, :engine_year, :number_of_engines, :allow_nil=>true

  def main_photo
    if photos.count > 0
       p = Photo.find_by_sql(["SELECT * FROM photos WHERE specification_id = ? ORDER BY photos.order ASC LIMIT 1", id])
       p.first.public_filename(:thumb)
    else
      "/images/main_silhouette.gif"
    end
  end

end
