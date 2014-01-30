require 'spec_helper'

describe Question do
  let(:section) do
    reading = FactoryGirl.create(:reading, user: FactoryGirl.create(:user) )
    FactoryGirl.create(:section, reading: reading)
  end

  it "has a valid factory" do
    FactoryGirl.build(:question)
      .is_a?(Question).should == true
  end

  it "is invalid without an associated Section" do
    question = FactoryGirl.build(:question)
    question.should_not be_valid

    question.section = section
    question.should be_valid
  end
  
  context do
    let(:question) { FactoryGirl.build(:question, section: section) }

    it "is invalid without a title" do
      question.should be_valid
      
      [nil, ''].each do |t| question.title = t 
        question.title = t
        question.should_not be_valid
      end
    end

    it "is invalid with a title of more than 160 characters" do
      question.title = 'a' * 160
      question.should be_valid

      question.title = 'a' * 161
      question.should_not be_valid
    end
  end

  context 'Answer' do
    let(:question) { FactoryGirl.build(:question, section: section) }

    it "is invalid with an answer of more than 1600 characters" do
      question.answer = 'x' * 1600
      question.should be_valid

      question.answer = 'x' * 1601
      question.should_not be_valid
    end

    it "is answered if answer is not nil neither empty(even with spaces)" do
      [nil, '', ' '].each do |a|
        question.answer = a
        question.should_not be_answered
      end
    end
  end
end
