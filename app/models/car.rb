class Car < ApplicationRecord
    validates :model, :manufacturer, :plate, :model_year, :manufacturer_year, presence: true
end
