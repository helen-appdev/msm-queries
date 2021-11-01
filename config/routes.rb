Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", {:controller => "directors", :action => "index"})

  get("/directors/eldest", {:controller => "directors", :action => "wisest"})

  get("/directors/youngest", {:controller => "directors", :action => "unwisest"})

  get("/directors/:director_id", {:controller => "directors", :action => "director_detail"})

  get("/movies", {:controller => "movies", :action => "index"})

  get("/movies/:movie_id", {:controller => "movies", :action => "movie_detail"})

  get("/actors", {:controller => "actors", :action => "index"})
  get("/actors/:actor_id", {:controller => "actors", :action => "actor_detail"})

end
