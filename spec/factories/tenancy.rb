FactoryBot.define do
    factory :tenancy do
        car
        tenant_cpf { CPF.generate }
        checkin { Time.now.utc.beginning_of_day }
        checkout { Time.now.utc.beginning_of_day + 1.days }
    end
end