FactoryBot.define do
  factory :user do
    nickname                  {Faker::Name.initials(number: 3)}
    email                     {Faker::Internet.email}
    password                  {"abc123"}
    password_confirmation     {password}
    first_name                {"あア亜"}
    last_name                 {"いイ伊"}
    first_furigana            {"アアア"}
    last_furigana             {"イイイ"}
    birthday                  {Faker::Date.in_date_period}
  end
end
