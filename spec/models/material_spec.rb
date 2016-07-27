require 'rails_helper'

RSpec.describe Material, :type => :model do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:material)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:material, title:nil)
  }

  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }

    it "is valid with a title" do
      material = FactoryGirl.build(:material, valid_attributes)
      expect(material).to be_valid
    end
    it "is invalid without a title" do
      material = FactoryGirl.build(:material, invalid_attributes)
      expect{material.save!}.to raise_error
    end
  end

  describe "Duration" do
    let(:material) {
      FactoryGirl.build(:material, valid_attributes)
    }
    context 'eom and som passed as datetime' do
      it "should be the difference of eom and som in seconds" do
        material.som = "2016-07-24 20:01:36"
        material.eom = "2016-07-24 20:01:40"
        expect(material.duration).to eq(4)
      end
    end

    context 'eom and som passed as integer' do
      it "should be the difference of eom and som in seconds" do
        material.som = "10"
        material.eom = "12"
        expect(material.duration).to eq(7200)
      end
    end

  end

end
