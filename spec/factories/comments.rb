FactoryGirl.define do
  factory :topic do
    body 'Comment Body'
    post my_post
    user my_user
  end
end
