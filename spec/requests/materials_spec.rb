require 'rails_helper'

RSpec.describe "Materials API", :type => :request do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:material)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:material, title:nil)
  }

  describe "GET /materials" do
    it "sends a list of materials" do
      FactoryGirl.create_list(:material, 10)
      get '/materials'

      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response.status).to be(200)
      expect(response).to be_success

      # check to make sure the right amount of materials are returned
      expect(json.length).to eq(10)

    end
  end

  describe "GET /materials/:id" do
    let(:material) {
      FactoryGirl.create(:material)
    }
    it "sends a material" do
      FactoryGirl.create(:material)
      get "/materials/#{material.to_param}"

      json = JSON.parse(response.body)
      puts json
      # test for the 200 status-code
      expect(response.status).to be(200)
      expect(response).to be_success

      # check to make sure the right amount of materials are returned
      expect(json["title"]).to eq(material.title)
      expect(json["duration"]).to eq(material.duration)
      expect(json["supplier"]["name"]).to eq(material.supplier.name)

    end
  end

  describe "WITH valid attributes" do
    describe "PATCH /materials/:id" do
      let(:material) {
        FactoryGirl.create(:material)
      }
      it "update a material" do
        patch "/materials/#{material.to_param}", material: valid_attributes
        expect(response.status).to be(204)
        expect(response).to be_success
      end
    end
  end

  describe "WITH invalid attributes" do
    describe "PATCH /materials/:id" do
      let(:material) {
        FactoryGirl.create(:material)
      }
      it "update a material" do
        patch "/materials/#{material.to_param}", material: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
