class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def find_movies_by_same_director
    if director.empty?
      []
    else
      Movie.where("director = ?", director).all
   end
  end
end
