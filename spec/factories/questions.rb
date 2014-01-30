# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "What is this chapter about?"
    answer "Is about an example reading's chapter for the tests"
  end
end
