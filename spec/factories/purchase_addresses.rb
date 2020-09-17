FactoryBot.define do
  factory :purchase_address do
    token {'teteteteet'}
    postcode {'123-4567'}
    prefecture {1}
    city {'千葉市'}
    number {'美浜区123'}
    building {'鏑木ビル323'}
    phone { 28012345678 }
  end
end
