# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  name                   :string(255)
#  company                :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  admin                  :boolean          default(FALSE)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
