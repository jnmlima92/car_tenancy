FactoryBot.define do
    factory :car do
        model { FFaker::Vehicle.model }
        plate { FFaker::Vehicle.vin }
        manufacturer { FFaker::Vehicle.make }
        model_year { FFaker::Vehicle.year.to_i }
        manufacturer_year { FFaker::Vehicle.year.to_i }
    end
end