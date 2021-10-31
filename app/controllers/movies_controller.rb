class MoviesController < ApplicationController
  def index
  @list_of_movies = Movie.all
  @list_of_directors = Director.all
  # @movie_director = Director.where({:id => @list_of_movies.director_id})
  
  #@director_names=directors.where({:id => @list_of_movies.director_id})
  render({:template => "/movies_templates/index.html.erb"})
  end
  
  
  def movie_detail
    @id = params.fetch("movie_id")
    a = Movie.all
    b = a.where({:id => @id})
    movie = b.at(0)
    @id = movie.id
    @title = movie.title
    @year = movie.year
    @duration = movie.duration
    @description = movie.description

    aa = Director.all
    bb = aa.where({:id => movie.director_id})
    cc= bb.at(0)
    @director_name = cc.name
    
    created_at = movie.created_at.strftime("%Y-%m-%d")
    @created = (Date.today-Date.parse(created_at)).to_i/365.to_i
    updated_at = movie.updated_at.strftime("%Y-%m-%d")
    @updated = (Date.today-Date.parse(updated_at)).to_i/365.to_i

    render ({:template => "movies_templates/detail.html.erb"})
  end

end