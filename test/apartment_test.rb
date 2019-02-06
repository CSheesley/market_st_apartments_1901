require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/renter'
require './lib/apartment'
require 'pry'

class ApartmentTest < Minitest::Test

  def setup
    @a1 = Apartment.new(
      {number: "A1",
        monthly_rent: 1200,
        bathrooms: 1,
        bedrooms: 1})
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists

    assert_instance_of Apartment, @a1
  end

  def test_it_has_an_apartment_number

    assert_equal "A1", @a1.number
  end

  def test_it_has_a_rent_value

    assert_equal 1200, @a1.monthly_rent
  end

  def test_it_has_a_bathroom_count

    assert_equal 1, @a1.bathrooms
  end

  def test_it_has_a_bedroom_count

    assert_equal 1, @a1.bedrooms
  end

  def test_it_start_without_a_renter

    assert_nil @a1.renter
  end

  def test_it_can_add_a_renter
    @a1.add_renter(@jessie)

    assert_equal @jessie, @a1.renter
  end

end
