require 'search_helper'
require 'api_helper'
class WelcomeController < ApplicationController
  include SearchHelper, ApiHelper

  #############
  # Search Pages
  ############
  def index
    respond_to do |format|
      format.html { @title = application_url } # index.html.erb
      format.xml do
        case params[:method]
          when 'specifications_get'
	    render :xml => specifications_get 
          when 'specification_get'
	    render :xml => specification_get(params[:id])
          when 'specification_photos_get'
	    render :xml => specification_photos_get(params[:specification_id])
          when 'specification_photo_get'
	    render :xml => specification_photo_get(params[:specification_id], params[:id])
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
     @title = params[:query]

     # split into words     
     tokens = params[:query].split(" ")
     tokens = tokens[0..2]  # ignore more than 3 terms

     @specs = Photo.paginate_by_sql(make_sql(tokens), :page=>params[:page], :order=>"manufacturer, length DESC")
    end
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
    render :partial=>"queries"
  end
end
