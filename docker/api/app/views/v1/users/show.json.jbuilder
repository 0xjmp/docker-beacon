json.user do
  json.partial! 'v1/users/user', user: @user, as: :user
end