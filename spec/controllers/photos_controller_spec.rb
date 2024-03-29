require 'rails_helper'

RSpec.describe PhotosController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to be_success
    end
  end

  describe "GET capture" do
    it "returns http success" do
      get :capture
      expect(response).to be_success
    end
  end

  describe "GET frame" do
    it "returns http success" do
      get :frame
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to be_success
    end
  end

end
