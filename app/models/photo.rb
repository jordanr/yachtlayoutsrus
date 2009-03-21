require 'mime/types'
class Photo < ActiveRecord::Base
  belongs_to :specification

  has_attachment :content_type => :image, 
                 :storage => :file_system,
		 :size=> 1..10.megabyte,
                 :resize_to => '1000x1000>',
                 :thumbnails => { :thumb => '150x150>'},
		 :processor=> :MiniMagick

  validates_as_attachment

  #????  named_scope :masters, :conditions => {:parent_id => nil}
  
  # Map file extensions to mime types.
  # Thanks to bug in Flash 8 the content type is always set to application/octet-stream.
  # From: http://blog.airbladesoftware.com/2007/8/8/uploading-files-with-swfupload
  def swf_uploaded_data=(data)
    data.content_type = MIME::Types.type_for(data.original_filename)
    self.uploaded_data = data
  end

  def to_xml(options = {})
    if options.delete(:thumb)
      options.merge!(:only=> [:id, :specification_id, :manufacturer, :model, :year])
    else
      options.merge!(:only=> [:id, :specification_id, :filename, :created_at, :updated_at])
    end
    super(options) do |xml|
      xml.full HOST + public_filename
      xml.thumb HOST + public_filename(:thumb)
    end
  end


end
