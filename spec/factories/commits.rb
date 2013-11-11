# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :commit do
    sha "MyString"
    committer "MyString"
    comment "MyString"
    author "MyString"
    authored_date "2013-10-25 17:59:23"
    committed_date "2013-10-25 17:59:23"
    message "MyString"
    sha_short "MyString"
  end
end
