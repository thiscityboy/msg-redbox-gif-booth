# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    family_name "MyString"
    mdn "MyString"
    content_base64 "MyText"
    content_type "MyString"
    content_filename "MyString"
  end
end
