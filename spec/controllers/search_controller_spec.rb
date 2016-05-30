require 'rails_helper'

describe Api::SearchController do
  context "search" do
    context "success" do
      it "should return photo objects from result set" do
        get :search, search_text: "sample text"

        json_response = JSON.parse(response.body)

        json_response.count > 1
      end
    end

    context "failure" do
      context "no parameters sent" do
        it "should return an error message from flickr" do
          get :search, search_text: ""

          json_response = JSON.parse(response.body)

          json_response['error']['code'].should eql(3)
        end
      end
    end
  end
end