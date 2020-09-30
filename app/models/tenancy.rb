class Tenancy < ApplicationRecord
  validates :tenant_cpf, numericality: true, presence: true
  validates_length_of :tenant_cpf, minimum: 11, maximum: 11, allow_blank: false
  belongs_to :car

  validate :check_availability

  def check_availability
      vehicle_tenancies = Tenancy.where(car_id: self.car_id)

      if vehicle_tenancies.present?
          checkin_match_tenancies = vehicle_tenancies.where(checkin: self.checkin..self.checkout).where.not(id: self.id).exists?
          checkout_match_tenancies = vehicle_tenancies.where(checkout: self.checkin..self.checkout).where.not(id: self.id).exists?

          if checkin_match_tenancies
              self.errors.add(:checkin, "date is not unavailable")
          end

          if checkout_match_tenancies
              self.errors.add(:checkin, "date is not unavailable")
          end
      end
  end
  
end
