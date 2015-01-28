require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it "has a valid factory" do
  	expect(FactoryGirl.create(:comment)).to be_valid
  end
  it "is invalid without a body" do
  	expect(FactoryGirl.build(:comment, body: nil)).to_not be_valid
  end
end
