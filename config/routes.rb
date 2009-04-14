ActionController::Routing::Routes.draw do |map|
  # specifications
  map.resources :specifications, :has_many=>[:photos]
 
  # welcome
  map.root :controller => "welcome"
  map.search 'search', :controller => 'welcome', :action => 'search'
  map.auto_complete 'auto_complete', :controller => 'welcome', :action => 'auto_complete'
  map.about 'about', :controller => 'welcome', :action => 'about'
  map.advertising 'advertising', :controller => 'welcome', :action => 'advertising'


  # developers
  map.developers 'developers', :controller => 'developers', :action => 'developers'
  map.documentation 'documentation', :controller => 'developers', :action => 'documentation'
  map.libraries 'libraries', :controller => 'developers', :action => 'libraries'
  map.examples 'examples', :controller => 'developers', :action => 'examples'

end
