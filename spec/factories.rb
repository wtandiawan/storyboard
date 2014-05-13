FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :story do
    sequence(:title) {|n|"Example Title #{n}"}
    content "Lorem ipsum"
    user
  end
end

