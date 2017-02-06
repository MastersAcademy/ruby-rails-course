require 'faker'

user_ids = User.pluck(:id)

15.times do
  user_id     = user_ids.sample
  title       = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph(5, false, 10)

  Post.create(user_id: user_id, title: title, description: description)
end
