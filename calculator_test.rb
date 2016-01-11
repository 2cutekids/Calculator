require 'test/unit'
require './calculate.rb'

class CalcTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @calc = Calculate.new()
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end



  def test_division_by_zero
    assert_raise ZeroDivisionError  do
      @calc.calculate_expression("10 / 0")
    end
  end
  def test_validations_letter
    assert_raise StandardError do
      @calc.validate_expression("1234k")
    end

  end
  def test_validations_two_decimal
    assert_raise StandardError do
      @calc.validate_expression("1234.6.7")
    end

  end
  def test_validations_ok
    assert_nothing_thrown  do
      @calc.validate_expression("1234.60")
      @calc.validate_expression("123")
    end

  end

  def test_calculations
    assert_equal("10",@calc.calculate_expression("10"))
    @calc = Calculate.new()
    assert_equal("10.0",@calc.calculate_expression("10.0"))
    @calc = Calculate.new()
    assert_equal("20.0",@calc.calculate_expression("10 * 2"))
    @calc = Calculate.new()
    assert_equal("20.0",@calc.calculate_expression("10.0 * 2.0"))
    @calc = Calculate.new()
    assert_equal("10.0",@calc.calculate_expression("2 + 8"))
    @calc = Calculate.new()
    assert_equal("10.0",@calc.calculate_expression("2.0 + 8.0"))
    @calc = Calculate.new()
    assert_equal("10.0",@calc.calculate_expression("5 * 2"))
    @calc = Calculate.new()
    assert_equal("10.0",@calc.calculate_expression("5.0 * 2.0"))
    @calc = Calculate.new()
    assert_equal("10.0",@calc.calculate_expression("5.0 * 3.0 - 5 * 1"))

  end
end