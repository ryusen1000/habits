FactoryBot.define do
  factory :profile do
    age            { 35 }
    weight         { 50 }
    association :user
  end
end
