class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    @units.sum do |unit|
      unit.monthly_rent.to_f / @units.count
    end
  end

  def renter_with_highest_rent
    priciest_unit = occupied_units.max_by do |unit|
      unit.monthly_rent
    end
    priciest_unit.renter
  end

  def occupied_units
    @units.reject do |unit|
      unit.renter.nil?
    end
  end

  def annual_breakdown
    #hash output. Key - name, Value - monthly_rent * 12
    occupied_units.inject({}) do |breakdown, unit|
      breakdown[unit.renter.name] = unit.monthly_rent * 12
      breakdown
    end
  end

# * original method - worked, but renter not tied to thier rent
  # def annual_breakdown
  #   annual_breakdown = Hash[all_renters.zip(all_annual_rents)]
  # end

  def all_renters
    all_renters = occupied_units.map do |unit|
      unit.renter.name
    end
  end

  def all_annual_rents
    all_annual_rents = occupied_units.map do |unit|
      unit.monthly_rent * 12
    end
  end

end
