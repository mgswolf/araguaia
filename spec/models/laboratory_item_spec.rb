require 'spec_helper'

describe LaboratoryItem do
  let(:laboratory_item) { FactoryGirl.build(:laboratory_item) }
  subject { laboratory_item }

  it { should respond_to(:title) }
  it { should be_valid }

  describe "title can't be blank" do
    before { laboratory_item.title = nil }
    it { should_not be_valid }
  end
end
