json.users @users do |user|
  json.email user.email
  json.first_name user.first_name
  json.last_name user.last_name
  json.about user.about
end
