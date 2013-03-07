# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  caption            :string(255)
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cover_file_name    :string(255)
#  cover_content_type :string(255)
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#

require 'spec_helper'

describe Job do
  let(:job) { FactoryGirl.build(:job) }
  subject { job }

  it { should respond_to(:title) }
  it { should respond_to(:caption) }


  it { should be_valid }

  describe "Title can't be blank" do
    before { job.title = nil }
    it { should_not be_valid }
  end
end
