require 'rails_helper'

RSpec.describe Material, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:material)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:material, title:nil)
  }

  it "is valid with a title" do
    material = FactoryGirl.build(:material, valid_attributes)
    expect(material).to be_valid
  end
  it "is invalid without a title" do
    material = FactoryGirl.build(:material, invalid_attributes)
    expect{material.save!}.to raise_error
  end

end
