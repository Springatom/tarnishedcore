require 'faker'

FactoryBot.define do
  factory :item do
    amount { Faker::Number.number(digits: 4) }
    note { Faker::Lorem.word }
    tag_ids { [ create(:tag, user: user).id ] }
    happened_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    kind { "expenses" }
    user
  end
end