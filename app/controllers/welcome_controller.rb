class WelcomeController < ApplicationController
#  skip_before_filter :verify_authenticity_token
#  protect_from_forgery :only=>:none

  layout 'devels', :only=>[:developers,:developers_api,:developers_schema,:developers_rails]
  
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml do
        case params[:method]
          when 'specifications_get'
            redirect_to('/specifications.xml')
          when 'specification_get'
            redirect_to("/specifications/#{params[:id]}.xml")
          when 'specification_photos_get'
            redirect_to("/specifications/#{params[:specification_id]}/photos.xml")
          when 'specification_photo_get'
            redirect_to("/specifications/#{params[:specification_id]}/photos/#{params[:id]}.xml")
          else
            render :status=>500
        end
      end
    end
  end

  def search
     spec = params[:specification]
     @specs = Specification.find_by_sql(["SELECT * FROM specifications WHERE manufacturer = ? ORDER BY length DESC", params[:query]])
  end

  #####################3
  # Docs
  ####################
  def about
    render :layout => 'docs'
  end
  def advertising
    render :layout => 'docs'
  end
  def developers
  end
  def developers_api
  end
  def developers_schema
  end
  def developers_rails
  end


  ##################
  # ajax
  #################
  def auto_complete
    @queries = Specification.find_by_sql(["SELECT DISTINCT manufacturer FROM specifications WHERE LOWER(manufacturer) LIKE ?", '%' + params[:query] + '%'])
    render :partial=>"queries"
  end
end
