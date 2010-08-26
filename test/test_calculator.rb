require 'helper'

class TestCalculator < Test::Unit::TestCase
  
  def test_last_week_range
    sunday = Date.today.wday == 0 ? Date.today : parse('last Sunday')
    sunday -= 7
    saturday = sunday + 6
    assert_equal sunday..saturday, DateCasually::Calculator.last_week_range
  end
  
  def test_last_sunday
    sunday = Date.today.wday == 0 ? Date.today : parse('last Sunday')
    sunday -= 7
    assert_equal sunday, DateCasually::Calculator.last_sunday
  end
  
  def test_this_past_sunday
    sunday = Date.today.wday == 0 ? Date.today : parse('last Sunday')
    assert_equal sunday, DateCasually::Calculator.this_past_sunday
  end
  
  def test_next_week_range
    sunday = parse('next Sunday')
    assert_equal sunday..sunday + 6, DateCasually::Calculator.next_week_range
  end
  
  def test_this_week_range
    sunday = Date.today.wday == 0 ? Date.today : parse('last Sunday')
    saturday = sunday + 6
    assert_equal sunday..saturday, DateCasually::Calculator.this_week_range
  end
  
  def test_next_sunday
    assert_equal parse('next Sunday'), DateCasually::Calculator.next_sunday
  end
  
  (1..100).each do |x|
    define_method("test_#{x}_weeks_from_today".to_sym) do
      assert_equal x, DateCasually::Calculator.number_of_weeks_from_today(parse("in #{x} weeks"))
    end
  end

  (1..200).each do |x|
    define_method("test_#{x}_months_from_today".to_sym) do
      assert_equal x, DateCasually::Calculator.number_of_months_from_today(parse("in #{x} months"))
    end
    define_method("test_#{x}_months_ago".to_sym) do
      assert_equal x, DateCasually::Calculator.number_of_months_from_today(parse("#{x} months ago"))
    end
  end

  (1..400).each do |x|
    define_method("test_#{x}_years_from_today".to_sym) do
      assert_equal x, DateCasually::Calculator.number_of_years_from_today(parse("in #{x} years"))
    end
  end
  
end