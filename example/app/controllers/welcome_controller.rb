class WelcomeController < ApplicationController
  def index
    @specs = Specification.find(:all)
  end

  def show_spec
    if(params[:specification_id] == "0")
      render :text=> "" 
    else  
      @specification = Specification.find(params[:specification_id])
      @photos = @specification.photos
      render :partial=>'show_spec'
    end
  end
end
