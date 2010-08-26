require 'rubygems'
require 'test/unit'
require 'chronic'
require 'timecop'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'date-casually'

t = Time.local(2008, 9, 1, 10, 5, 0)
Timecop.travel(t)

class Test::Unit::TestCase
  def parse(string)
    Date.parse(Chronic.parse(string).strftime('%b %d, %Y'))
  end

  def self.method_name(name, options)
    if (options != nil) && options.has_key?(:as)
      "test_#{name}_as_#{options[:as]}"
    else
      "test_#{name}"
    end
  end  
    
end