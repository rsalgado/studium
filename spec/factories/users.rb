FactoryGirl.define do
  factory :user do |f|
    f.email 'jon-doe@example.com'
    f.password 'foobarbaz'
    f.password_confirmation 'foobarbaz'
  end
end