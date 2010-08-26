require 'helper'

class TestYears < Test::Unit::TestCase
  
  # Test year ranges both with and without the :as => :years option
  [nil, {:as => :years}].each do |options|
    define_method method_name('less_than_a_year_ago', options) do
      date = parse('3 months ago')
      assert_equal I18n.t('date.casual.less_than_a_year_ago'), date.casual(options)    
    end

    define_method method_name('less_than_a_year_from_now', options) do
      date = parse('in 3 months')
      assert_equal I18n.t('date.casual.less_than_a_year_from_now'), date.casual(options)    
    end
  
    define_method method_name('exactly_one_year_from_now', options) do
      date = parse('in 1 year')
      assert_equal I18n.t('date.casual.next_year'), date.casual(options)    
    end
  
    define_method method_name('exactly_one_year_ago', options) do
      date = parse('1 year ago')
      assert_equal I18n.t('date.casual.last_year'), date.casual(options)    
    end
  
    define_method method_name('next_year', options) do
      date = parse('in 1 year') + 2
      assert_equal I18n.t('date.casual.next_year'), date.casual(options)    
    end
  
    define_method method_name('last_year', options) do
      date = parse('1 year ago') - 2
      assert_equal I18n.t('date.casual.last_year'), date.casual(options)    
    end
  
    define_method method_name('couple_of_years_from_now', options) do
      date = parse('in 2 years')
      assert_equal I18n.t('date.casual.couple_of_years_from_now'), date.casual(options)    
    end
  
    define_method method_name('couple_of_years_ago', options) do
      date = parse('2 years ago')
      assert_equal I18n.t('date.casual.couple_of_years_ago'), date.casual(options)    
    end
    
    # Since years is our highest unit of time (as opposed to decades, etc),
    # we'll also test year counts both with and without the :as => :years option.
    (3..10).each do |x|
      define_method method_name("#{x}_years_ago", options) do
        date = parse("#{x} years ago")
        assert_equal I18n.t('date.casual.years_ago', :number => x), date.casual(options)        
      end
      define_method method_name("#{x}_years_from_now", options) do
        date = parse("in #{x} years")
        assert_equal I18n.t('date.casual.years_from_now', :number => x), date.casual(options)
      end
    end
  end
end