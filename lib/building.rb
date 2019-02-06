class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    all_rents = []
    @units.select do |unit|
    all_rents << unit.monthly_rent.to_f
    end

    all_rents.sum / all_rents.count
  end

  def renter_with_highest_rent
    priciest_unit = occupied_units.max_by do |unit|
      unit.monthly_rent
    end
    priciest_unit.renter
  end

  def occupied_units
    @units.reject do |unit|
      unit.renter == nil
    end
  end

# surely a better way to get this result where names are tied to the rent that
# they pay. Right now it happens to match up this way, but if arrays were
# sorted, this would break.
  def annual_breakdown
    annual_breakdown = Hash[all_renters.zip(all_annual_rents)]
  end

  def all_renters
    all_renters = []
    all_renters = occupied_units.map do |unit|
      unit.renter.name
    end
    all_renters
  end

  def all_annual_rents
    all_annual_rents = []
    all_annual_rents = occupied_units.map do |unit|
      unit.monthly_rent * 12
    end
    all_annual_rents
  end

end
