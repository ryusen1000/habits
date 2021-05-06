FactoryBot.define do
  factory :task do
    theme            { "毎日運動がしたい" }
    goal             { "体重10kg減" }
    association :user
  end
end
