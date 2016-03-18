FactoryGirl.define do
  factory :topic do
    body 'Topic Body'
    post my_post
    user my_user
  end
end
