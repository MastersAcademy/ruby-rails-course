json.posts @posts do |post|
  json.user do
    json.email post.user.email
    json.first_name post.user.first_name
    json.last_name post.user.last_name
    json.about post.user.about
  end

  json.title post.title
  json.description post.description
end
