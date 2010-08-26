require 'helper'

class TestMonths < Test::Unit::TestCase
  
  # Test month ranges both with and without the :as => :months option
  [nil, {:as => :months}].each do |options|
    define_method method_name('less_than_a_month_ago', options) do
      date = parse('3 weeks ago')
      assert_equal I18n.t('date.casual.less_than_a_month_ago'), date.casual(options)    
    end

    define_method method_name('less_than_a_month_from_now', options) do
      date = parse('in 3 weeks')
      assert_equal I18n.t('date.casual.less_than_a_month_from_now'), date.casual(options)    
    end
  
    define_method method_name('exactly_one_month_from_now', options) do
      date = parse('1 month from now')
      assert_equal I18n.t('date.casual.next_month'), date.casual(options)    
    end
  
    define_method method_name('exactly_one_month_ago', options) do
      date = parse('1 month ago')
      assert_equal I18n.t('date.casual.last_month'), date.casual(options)    
    end
  
    define_method method_name('next_month', options) do
      date = parse('in 1 month') + 1
      assert_equal I18n.t('date.casual.next_month'), date.casual(options)    
    end
  
    define_method method_name('last_month', options) do
      date = parse('1 month ago') - 1
      assert_equal I18n.t('date.casual.last_month'), date.casual(options)    
    end
  
    define_method method_name('couple_of_months_from_now', options) do
      date = parse('in 2 months')
      assert_equal I18n.t('date.casual.couple_of_months_from_now'), date.casual(options)    
    end
  
    define_method method_name('couple_of_months_ago', options) do
      date = parse('2 months ago')
      assert_equal I18n.t('date.casual.couple_of_months_ago'), date.casual(options)    
    end
  end
  
  (3..24).each do |x|
    define_method "test_#{x}_months_ago_as_months" do
      date = parse("#{x} months ago")
      assert_equal I18n.t('date.casual.months_ago', :number => x), date.casual(:as => :months)
    end
    define_method "test_#{x}_months_from_now_as_months" do
      date = parse("in #{x} months")
      assert_equal I18n.t('date.casual.months_from_now', :number => x), date.casual(:as => :months)
    end
  end
  
end