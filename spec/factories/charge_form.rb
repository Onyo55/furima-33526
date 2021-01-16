FactoryBot.define do
  factory :charge_form do
    postal_code       { '000-0000' }
    prefecture_id     { Faker::Number.within(range: 2..48) }
    city              { '渋谷区' }
    block             { '1-1-1' }
    building          { 'マンション' }
    phone_number      { '123456789' }
    token             { 'tok_abcdefghijk00000000000000000' }
    user_id           {Faker::Number.within(range: 1..10)}
    item_id           {Faker::Number.within(range: 1..10)}
  end
end
