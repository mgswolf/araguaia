# == Schema Information
#
# Table name: job_images
#
#  id               :integer          not null, primary key
#  job_id           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :integer
#  pic_updated_at   :datetime
#

require 'spec_helper'

describe JobImage do
  let(:job) { FactoryGirl.create(:job) }
  let(:job_image) { FactoryGirl.build(:job_image, job: job) }
  subject { user }

  it { should respond_to(:job) }

  it { should be_valid }

  describe "Job can't be blank" do
    before { job_image.job_id = nil }
    it { should_not be_valid }
  end
end
