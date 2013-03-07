require 'spec_helper'

describe Report do
  let(:user) { FactoryGirl.create(:user) }
  let(:report) { FactoryGirl.build(:report, user: user) }
  subject { report }

  it { should respond_to(:title) }
  it { should respond_to(:annex) }
  it { should respond_to(:user) }


  it { should be_valid }

  describe "title can't be blank" do
    before { report.title = nil }
    it { should_not be_valid }
  end

  describe "user can't be blank" do
    before { report.user_id = nil }
    it { should_not be_valid }
  end
end
