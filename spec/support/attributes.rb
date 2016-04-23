def user_attributes(overrides = {})
  { name: "billy kid",
    username: "billykid",
    email: "billy@email.com",
    organization: "billytheorg",
    password: "password" }.merge(overrides)
end
