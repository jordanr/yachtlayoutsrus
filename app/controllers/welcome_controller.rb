class WelcomeController < ApplicationController
#  skip_before_filter :verify_authenticity_token
#  protect_from_forgery :only=>:none

  layout 'devels', :only=>[:developers,:developers_api,:developers_schema,:developers_rails, :developers_example]
  
  def index
    respond_to do |format|
      format.html { render :layout=>"application.html.erb" } # index.html.erb
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
    if not params[:query] or params[:query] == ''
      redirect_to root_path
    else
     @specs = []
     tokens = params[:query].split(" ")
     tokens.each { |query|
       @specs += Specification.find_by_sql(["SELECT * FROM specifications WHERE LOWER(manufacturer) LIKE ? ORDER BY length DESC", '%'+ query+ '%'])
     }
     render :layout=>"application.html.erb"
    end
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
  def developers_example
  end


  ##################
  # ajax
  #################
  def auto_complete
    limit = 10 #how many results do you want?
    @queries = []
    count = 0
    entry = ' ' + params[:query].downcase 
    # space is word boundary. Downcase necessary?
    trigrams = (0..entry.length-3).collect {|idx| entry[idx,3]}
    trigram_groups = Trigram.sum(:score, :conditions => [ "tg IN (?)", trigrams], :group => 'specification_id')
    trigram_groups.sort_by {|a| -a[1]}.each do |group|
      @queries << Specification.find(group[0]) #get all the matching people
      count += 1
      break if count == limit
    end
#    @queries = Specification.find_by_sql(["SELECT DISTINCT manufacturer FROM specifications WHERE LOWER(manufacturer) LIKE ?", '%' + params[:query] + '%'])
    render :partial=>"queries"
  end
end
