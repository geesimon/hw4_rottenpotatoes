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
  end
  
end