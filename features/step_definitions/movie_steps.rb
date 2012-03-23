# Add a declarative step here for populating the DB with movies.

require 'ruby-debug'


Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create! movie
  end
  
  #assert false, "Unimplmemented"
end


Then /I want check page/ do
  save_and_open_page
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  
  table_text = page.find("#movies tbody").text
  table_text.index(e1).should < table_text.index(e2)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /^I (un)?check the following ratings: (.*)$/ do |uncheck, rating_string|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  
  rating_list = rating_string.gsub(/ /, '').split(',')
  
  unless uncheck
    checked_boxes = rating_list
    unchecked_boxes = Movie.all_ratings - checked_boxes
  else
    unchecked_boxes  = rating_list
    checked_boxes = Movie.all_ratings - unchecked_boxes
  end
  
  checked_boxes.each do |name|
    step %{I check "ratings_#{name}"}
  end
  
  unchecked_boxes.each do |name|
    step %{I uncheck "ratings_#{name}"}
  end
end

When /^all ratings selected$/ do
  Movie.all_ratings.each do |name|
    step %{I check "ratings_#{name}"}
  end
end

Then /^I should see all of the movie$/ do
  page.all("#movies tbody tr").size.should == 10
end

When /^no ratings selected$/ do
  Movie.all_ratings.each do |name|
    step %{I uncheck "ratings_#{name}"}
  end
end

Then /^I should not see any movie$/ do
  page.all("#movies tbody tr").size.should == 0
end

