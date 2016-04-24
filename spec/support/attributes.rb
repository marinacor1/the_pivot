def user_attributes(overrides = {})
  { name: "billy kid",
    username: "billykid",
    email: "billy@email.com",
    organization: "billytheorg",
    password: "password" }.merge(overrides)
end

def admin_user_attributes(overrides = {})
  { name: "iman admin",
    username: "billyadmin",
    email: "admin@email.com",
    organization: "admintheorg",
    password: "password",
    role: 1}.merge(overrides)
end
