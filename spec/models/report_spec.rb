# == Schema Information
#
# Table name: reports
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  report_date        :date
#  description        :text
#  user_id            :integer
#  slug               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  annex_file_name    :string(255)
#  annex_content_type :string(255)
#  annex_file_size    :integer
#  annex_updated_at   :datetime
#

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
