FactoryGirl.define do
  factory :comment do
    body 'Topic Body'
    post my_post
    user my_user
  end
end
