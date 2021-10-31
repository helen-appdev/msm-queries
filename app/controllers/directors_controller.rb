class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all #"I like to prepare my data in the action and in the view not worry about where it's coming from"

      render({:template => "directors_templates/index.html.erb"})
  end

def wisest
  a = Director.all.order({:dob => :asc})
  b = a.where.not({:dob => nil}) 
  @name = b.at(0).name
  @dob = b.at(0).dob.strftime("%B %d, %Y")
  render({:template => "directors_templates/eldest.html.erb"})
end

def unwisest
  a = Director.all.order({:dob => :desc})
  b = a.where.not({:dob => nil}) 
  c = b.at(0)
  @name = c.name
  @dob = c.dob.strftime("%B %d, %Y")
  render({:template => "directors_templates/youngest.html.erb"})
end


def director_detail
    @id = params.fetch("director_id") 
    director_list = Director.all
    detail = director_list.where({:id => @id})
    entry = detail.at(0)
    @name = entry.name
    @dob = entry.dob.strftime("%Y-%m-%d")
    @bio = entry.bio
    created_at = entry.created_at.strftime("%Y-%m-%d")
    @created = (Date.today-Date.parse(created_at)).to_i/365.to_i
    updated_at = entry.updated_at.strftime("%Y-%m-%d")
    @updated = (Date.today-Date.parse(updated_at)).to_i/365.to_i

    a = Movie.all
    @movie_list = a.where({:director_id => @id})

    render ({:template => "directors_templates/detail.html.erb"})
  end
end
