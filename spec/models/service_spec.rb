# == Schema Information
#
# Table name: services
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :text
#  caption            :string(255)
#  slug               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cover_file_name    :string(255)
#  cover_content_type :string(255)
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#

require 'spec_helper'

describe Service do
  let(:service) { FactoryGirl.build(:service) }
  subject { service }

  it { should respond_to(:title) }
  it { should respond_to(:caption) }


  it { should be_valid }

  describe "title can't be blank" do
    before { service.title = nil }
    it { should_not be_valid }
  end
end
