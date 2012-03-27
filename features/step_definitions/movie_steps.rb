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


Then /^I want check page$/ do
  save_and_open_page
end


Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie_name, director_name|
  page.find("#main").text.gsub(/\n/,"").index(/#{movie_name}(.*)#{director_name}/).should_not == nil
end

#Then /^I should see "'([^"]*)' has no director info"$/ do |movie_name|
#  page.find('#movies tr', :text => movie_name).find('td:nth-child(2)').text.empty?.should == true
#end