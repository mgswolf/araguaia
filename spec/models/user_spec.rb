require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }
  subject { user }

  it { should respond_to(:username) }
  it { should respond_to(:name) }


  it { should be_valid }

  describe "Username can't be blank" do
    before { user.username = nil }
    it { should_not be_valid }
  end

  describe "Username should be unique" do
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.build(:user, username: user1.username) }
    subject { user2 }

    it { should_not be_valid}
  end

  describe "username shoud not be one of routes names" do
    let(:user) { FactoryGirl.build(:user, username: 'services') }
    subject { user }

    it { should_not be_valid }
  end


end
