require 'rails_helper'

RSpec.describe Supplier, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:supplier)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:supplier, name:nil)
  }

  it "is valid with a name" do
    supplier = FactoryGirl.build(:supplier, valid_attributes)
    expect(supplier).to be_valid
  end
  it "is invalid without a name" do
    supplier = FactoryGirl.build(:supplier, invalid_attributes)
    expect{supplier.save!}.to raise_error
  end

end
