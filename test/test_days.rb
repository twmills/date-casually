require 'helper'

class TestDays < Test::Unit::TestCase
  
  # Test day ranges both with and without the :as => :days option
  [nil, {:as => :days}].each do |options|
    define_method method_name('yesterday', options) do
      date = parse('yesterday')
      assert_equal I18n.t('date.casual.yesterday'), date.casual(options)
    end

    define_method method_name('tomorrow', options) do
      date = parse('tomorrow')    
      assert_equal I18n.t('date.casual.tomorrow'), date.casual(options)
    end
  
    define_method method_name('couple_of_days_ago', options) do
      date = parse('today') - 2
      assert_equal I18n.t('date.casual.couple_of_days_ago'), date.casual(options) 
    end
  
    define_method method_name('couple_of_days_from_now', options) do
      date = parse('today') + 2
      assert_equal I18n.t('date.casual.couple_of_days_from_now'), date.casual(options) 
    end
  end

  (3..366).each do |x|
    define_method "test_#{x}_days_ago_as_days" do
      date = parse("#{x} days ago")
      assert_equal I18n.t('date.casual.days_ago', :number => x), date.casual(:as => :days)
    end
    define_method "test_#{x}_days_from_now_as_days" do
      date = parse("in #{x} days")
      assert_equal I18n.t('date.casual.days_from_now', :number => x), date.casual(:as => :days)
    end
  end

  
end