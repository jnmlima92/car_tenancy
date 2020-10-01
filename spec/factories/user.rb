FactoryBot.define do
    factory :user do
        name { FFaker::NameBR.name }
        email { FFaker::Internet.email }
        password { FFaker::Lorem.characters(12) }
    end
end