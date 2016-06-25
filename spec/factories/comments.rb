FactoryGirl.define do
  factory :comment do
    body 'Topic Body'
    post
    user
  end
end
