FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { Faker::Internet.free_email }
    password              { 'a1s2d3f4' }
    password_confirmation { 'a1s2d3f4' }
    lastname              { '山田' }
    lastname_kana         { 'ヤマダ' }
    firstname             { '太郎' }
    firstname_kana        { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
