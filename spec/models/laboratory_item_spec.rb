# == Schema Information
#
# Table name: laboratory_items
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
