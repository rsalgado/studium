require 'spec_helper'

describe Reading do
  it "has a valid factory" do
    assert FactoryGirl.build(:reading).is_a? Reading
  end

  it "is invalid without an associated User" do
    user = FactoryGirl.create(:user)
    reading = FactoryGirl.build(:reading)

    reading.should_not be_valid
    
    reading.user = user
    reading.should be_valid
  end
  
  context "Title" do
    let(:user) { FactoryGirl.create(:user) }
    let(:reading) { FactoryGirl.create(:reading, user: user) }

    it "is invalid without a value" do
      reading.title = nil
      reading.should_not be_valid

      reading.title = ''
      reading.should_not be_valid
    end

    it "is invalid with more than 160 characters" do
      reading.title = 'a' * 160
      reading.should be_valid

      reading.title = 'a' * 161
      reading.should_not be_valid
    end
  end
end