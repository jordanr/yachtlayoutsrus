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

  def format_price
    price.nil? ? "" : "$#{number_with_delimiter(price)}"
  end

  def format_length
    length.nil? ? "" : "#{length}\'"
  end

end
