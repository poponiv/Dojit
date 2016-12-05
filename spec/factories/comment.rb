FactoryGirl.define do
  factory :comment do
    body "This is a new comment."
    user
    post
    #trait :comment_with_emails do
    #	before(:build) { ApplicationRecord.skip_callbacks = false }
    #end
  end
end
