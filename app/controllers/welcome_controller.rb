class WelcomeController < ApplicationController
  auto_complete_for :specification, :manufacturer

  def index
  end

  def search
     spec = params[:specification]
     @specs = Specification.find_by_sql(["SELECT * FROM specifications WHERE manufacturer = ?", spec[:manufacturer]])
     render :partial=> "results"
  end
end
