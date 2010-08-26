require 'helper'

class TestWeeks < Test::Unit::TestCase
  
  # Test week ranges both with and without the :as => :weeks option
  [nil, {:as => :weeks}].each do |options|
  
    define_method method_name('next_week', options) do
      date = DateCasually::Calculator.this_week_range.last + 3
      assert_equal I18n.t('date.casual.next_week'), date.casual(options)    
    end
  
    define_method method_name('last_week', options) do
      date = DateCasually::Calculator.last_sunday + 1
      assert_equal I18n.t('date.casual.last_week'), date.casual(options)    
    end
  
    define_method method_name('couple_of_weeks_from_now', options) do
      date = parse('in 2 weeks')
      assert_equal I18n.t('date.casual.couple_of_weeks_from_now'), date.casual(options)    
    end
  
    define_method method_name('couple_of_weeks_ago', options) do
      date = parse('2 weeks ago')
      assert_equal I18n.t('date.casual.couple_of_weeks_ago'), date.casual(options)    
    end
  end
  
  (3..53).each do |x|
    define_method "test_#{x}_weeks_ago_as_weeks" do
      date = parse("#{x} weeks ago")
      assert_equal I18n.t('date.casual.weeks_ago', :number => x), date.casual(:as => :weeks)
    end
    define_method "test_#{x}_weeks_from_now_as_weeks" do
      date = parse("in #{x} weeks")
      assert_equal I18n.t('date.casual.weeks_from_now', :number => x), date.casual(:as => :weeks)
    end
  end
  
end