require 'spec_helper'

describe DataImportController do

  describe "GET 'purchases'" do
    it "returns http success" do
      get 'purchases'
      response.should be_success
    end
  end

end
