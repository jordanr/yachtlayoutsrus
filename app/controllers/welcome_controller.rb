class WelcomeController < ApplicationController
  def index
  end

  def search
     spec = params[:specification]
     @specs = Specification.find_by_sql(["SELECT * FROM specifications WHERE manufacturer = ?", params[:query]])
  end

  # ajax
  def auto_complete
    @queries = Specification.find_by_sql(["SELECT DISTINCT manufacturer FROM specifications WHERE LOWER(manufacturer) LIKE ?", '%' + params[:query] + '%'])
    render :partial=>"queries"
  end
end
