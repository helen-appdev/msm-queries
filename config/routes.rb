Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", {:controller => "directors", :action => "index"})

  get("/directors/eldest", {:controller => "directors", :action => "wisest"})

  get("/directors/:directorid", {:controller => "directors", :action => "director_detail"})

end
