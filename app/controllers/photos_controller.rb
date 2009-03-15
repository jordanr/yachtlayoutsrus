class PhotosController < ApplicationController
  session :cookie_only => false, :only => :create
  layout 'admin'
 
  before_filter :authenticate, :except=>[:show, :index, :create]
  before_filter :get_spec

  def index
    @photos = @spec.photos
  end

  def show
    @photo = @spec.photos.find(params[:id])
    render :action=>'show', :layout=>'show'
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

      def dont_verified_request?
        print !protect_against_forgery?
        print request.method==:get     
        print           !verifiable_request_format?   
        print form_authenticity_token.to_s + "==" + params[request_forgery_protection_token].to_s
        !protect_against_forgery?     ||
          request.method == :get      ||
          !verifiable_request_format? ||
          form_authenticity_token == params[request_forgery_protection_token]
        true
      end

end
