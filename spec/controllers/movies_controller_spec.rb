require 'spec_helper'

describe MoviesController do

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET Similar Movie by Same Director" do
    before(:each) do
        @movie = Factory(:movie)
    end
    
    it "should be successful" do
      get :similar, :id=>@movie
      response.should be_success
    end
    
    it "should redirect to home page when no director is found" do
      bad_movie = Factory(:movie, :director => "")
      get :similar, :id=>bad_movie
      response.should redirect_to(movies_path)
    end
  end

end