require 'helper'

class TestDayOfWeek < Test::Unit::TestCase
  
  def test_next_wday
    date = parse('7 days from now')      
    assert_equal I18n.t("date.casual.next_wday_#{date.wday}"), date.casual(:as => :day_of_week)
  end
  
  def test_this_wday
    date = parse('3 days from now')      
    assert_equal I18n.t("date.casual.this_wday_#{date.wday}"), date.casual(:as => :day_of_week)
  end  
  
  def test_last_wday
    date = parse('7 days ago')
    assert_equal I18n.t("date.casual.last_wday_#{date.wday}"), date.casual(:as => :day_of_week)
  end
  
  def test_this_past_wday
    date = parse('3 days ago')
    assert_equal I18n.t("date.casual.this_past_wday_#{date.wday}"), date.casual(:as => :day_of_week)
  end

  (14..366).each do |x|
    weeks = x / 7
    define_method "test_#{x}_wdays_ago" do
      date = parse("#{x} days ago")
      assert_equal I18n.t("date.casual.wdays_ago_#{date.wday}", :number => weeks), date.casual(:as => :day_of_week)
    end
    define_method "test_#{x}_wdays_from_now" do
      date = parse("in #{x} days")
      assert_equal I18n.t("date.casual.wdays_from_now_#{date.wday}", :number => weeks), date.casual(:as => :day_of_week)
    end
  end
  
end