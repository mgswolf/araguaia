require 'spec_helper'

describe Equipment do
  let(:equipment) { FactoryGirl.build(:equipment) }
  subject { equipment }

  it { should respond_to(:title) }
  it { should be_valid }

  describe "title can't be blank" do
    before { equipment.title = nil }
    it { should_not be_valid }
  end
end
