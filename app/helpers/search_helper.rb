module SearchHelper

                #   ["SELECT photos.* FROM photos, specifications"+
                #         "WHERE (LOWER(manufacturer) LIKE ? OR LOWER(model) LIKE ? OR length = ?)"+
                #         "AND photos.specification_id = specifications.id"+
                #         "ORDER BY manufacturer, length DESC", "%#{query}%", "%#{query}%", query])
  def make_sql(terms)
    raise ArgumentError if terms.size == 0 or terms.size > 3
 
    sql = "SELECT photos.* FROM photos, specifications WHERE "
    qmarks = []
    terms.each do |query|
        sql += "(LOWER(manufacturer) LIKE ? OR LOWER(model) LIKE ? OR length = ?) AND "
        qmarks += ["%#{query}%", "%#{query}%", query]
    end

    sql += "photos.specification_id = specifications.id"
#    sql += "ORDER BY manufacturer, length DESC"
   
    [sql] + qmarks
  end
end
