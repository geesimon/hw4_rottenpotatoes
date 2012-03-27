require 'spec_helper'

describe Movie do
  before(:each) do
      @attr = { :title => "Example User", 
                :rating => "user@example.com",
                :director => "foobar",
                :release_date => "1977-05-25" 
                }
  end
  
  it "should create a new instance given valid attributes" do
      Movie.create!(@attr)
  end
  
  it "should find similar movie by same director" do
    movie1 = Factory(:movie)
    movie2 = Factory(:movie, :title => "My New Movie")
    
    movie1.find_movies_by_same_director.size.should == 2
  end
  
  it "should return empty can't find similar movie" do
    movie1 = Factory(:movie, :director => "")
    movie2 = Factory(:movie)
    
    movie1.find_movies_by_same_director.size.should == 0
  end
  
end