require 'rails_helper'

RSpec.describe Material, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #it { should validate_presence_of :title }
  # it "has a valid factory" do
  #   FactoryGirl.create(:material).should be_valid
  # end
  # it "is invalid without a title" do
  #   FactoryGirl.create(:material, title: nil).should be_invalid
  # end
  # it "is invalid without a supplier" do
  #   FactoryGirl.create(:material, supplier: nil).should be_invalid
  #end
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    # it { is_expected.to validate_presence_of(:supplier) }
    # it { is_expected.to validate_presence_of(:title) }
    # it { is_expected.to validate_presence_of(:episode) }
    # it { is_expected.to validate_presence_of(:year) }
    # it { is_expected.to validate_presence_of(:duration) }
    # it { is_expected.to validate_presence_of(:aspect_ratio) }
  end
end
