require 'spec_helper'

describe Section do
  let(:sample_reading) do
    FactoryGirl.create(:reading, user:  FactoryGirl.create(:user))
  end

  it "has a valid factory" do
    assert FactoryGirl.build(:section).is_a? Section
  end

  it "is invalid without an associated Reading" do
    section = FactoryGirl.build(:section)
    section.should_not be_valid
    
    section.reading = sample_reading
    section.should be_valid
  end
  
  it "is invalid with notes of more than 12000 characters" do
    section = FactoryGirl.build(:section, reading: sample_reading)
    
    section.notes = 'a'*12000
    section.should be_valid

    section.notes = 'a'*12001
    section.should_not be_valid
  end
  
  context "Name" do
    let(:section) do
      FactoryGirl.build(:section, reading: sample_reading)
    end

    it "is invalid without a name" do
      section.should be_valid

      section.name = nil
      section.should_not be_valid

      section.name = ''
      section.should_not be_valid
    end

    it "is invalid with more than 160 characters in name" do
      section.name = 'a' * 160
      section.should be_valid

      section.name = 'a' * 161
      section.should_not be_valid
    end
  end
end
