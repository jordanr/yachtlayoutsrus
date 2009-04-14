class PhotosController < ApplicationController
  session :cookie_only => false, :only => :create
 
  before_filter :authenticate, :except=>[:show, :index, :create]
  before_filter :get_spec

  def index
    @photos = @spec.photos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos.to_xml(:thumb=>true) }
    end
  end

  def show
    @photo = @spec.photos.find(params[:id])
    respond_to do |format|
      format.html # show..
      format.xml  { render :xml => @photo }
    end
  end

  def create
    @photo = @spec.photos.new(:swf_uploaded_data=>params[:Filedata])
    if @photo.save
      render :partial =>"flash_response"
    else
      render :text=> "error"
    end
  end

  def destroy
    @photo = @spec.photos.find(params[:id])
    @photo.destroy
    redirect_to(specification_photos_url)
  end

  protected
    def get_spec
      @spec = Specification.find(params[:specification_id])
    end
end
