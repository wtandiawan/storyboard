require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_stories
  end
end

def make_users
  admin = User.create!(username:     "wtandiawan",
                       email:    "wtandiawan@wisc.edu",
                       password: "foobar",
                       password_confirmation: "foobar")
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@example.org"
    password  = "foobar"
    User.create!(username:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_stories
  users = User.all(limit: 6)
  i = 0
  5.times do
    i = i+1
    title = "Example Title-#{i}"
    content = Faker::Lorem.sentence(130)
    users.each { |user| user.stories.create!(title: title, content: content, like: 0, dislike: 0) }
  end
end



