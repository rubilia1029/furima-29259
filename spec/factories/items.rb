FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    explain { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    fee_id { 2 }
    area_id { 1 }
    day_id { 2 }
    price { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
