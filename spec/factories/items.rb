FactoryBot.define do
  factory :item do
    name            {Faker::Name.first_name}
    price           {Faker::Number.within(range: 300..9999999)}
    text            {Faker::Coffee.blend_name}
    category_id     {Faker::Number.within(range: 2..11)}
    state_id        {Faker::Number.within(range: 2..7)}
    prefecture_id   {Faker::Number.within(range: 2..48)}
    ship_day_id     {Faker::Number.within(range: 2..4)}
    ship_fee_id     {Faker::Number.within(range: 2..3)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'),filename: 'test_image.png')
    end
  end
end
