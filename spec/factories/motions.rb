FactoryBot.define do
  factory :motion do
    act            { "プッシュアップ" }
    amount         { 100 }
    if_act         { "プッシュアップ" }
    if_amount      { 50 }
    association :task
  end
end
