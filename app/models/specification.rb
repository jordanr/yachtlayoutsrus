require 'action_view/helpers/number_helper'
class Specification < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  has_many :photos, :dependent=>:destroy

  validates_numericality_of :length, :year, :engine_year, :number_of_engines, :allow_nil=>true

  def main_photo(thumbnail=nil)
    if photos.count > 0
       p = Photo.find_by_sql(["SELECT * FROM photos WHERE specification_id = ? LIMIT 1", id])
       p.first.public_filename(thumbnail)
    else
       thumbnail ? "/images/main_silhouette.gif" : ""
    end
  end

#  alias_method :ar_to_xml, :to_xml
  def to_xml(options = {})
    if options.delete(:thumb)
      options.merge!(:only=> [:id, :length, :manufacturer, :model, :year, :price])
      super(options) { |xml| xml.thumb HOST + main_photo(:thumb) }
    else
      super(options) { |xml| xml.full HOST + main_photo }
    end
  end

  def to_s
    "#{length} #{manufacturer} #{model} #{year}"
  end

  def to_s2
    "#{length} #{model} #{year}"
  end

  def to_s3
    "#{length} #{manufacturer} #{model} #{year} #{format_price}"
  end

  def to_s4
    "#{length} #{model} #{year} #{format_price}"
  end

  def to_s5
    delim = ""
    if format_price != "" and time_to_sell.to_s != ""
      delim = " - sells in "
    end
    "#{format_price}#{delim}#{time_to_sell}"
  end

  def format_price
    price.nil? ? "" : "$#{number_with_delimiter(price)}"
  end

  def format_length
    length.nil? ? "" : "#{length}\'"
  end

  def spec_names
    %w{ hull_material designer
	loa lod lwl beam min_draft max_draft bridge_clearance 
	displacement ballast cruise_speed max_speed 
	fuel_tanks water_tanks holding_tanks 
 	engine_manufacturer engine_model engine_fuel engine_horsepower
	engine_year number_of_engines }
  end

end
