FactoryGirl.define do
  factory :user do
    username "tyler"
    email    "tyler@example.com"
    password "secretepassword"
    password_confirmation "secretepassword"
  end

  factory :task do
  	content "Lorem Ipsum"
  	user
  end
end
