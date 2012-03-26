# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :movie do |movie|    
    movie.title "Star Wars"
    movie.rating "PG"
    movie.director "George Lucas "
    movie.release_date "1977-05-25" 
end

# title        | rating | director     | release_date |