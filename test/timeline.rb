require 'helper'
max = 400
as = :week
max.downto(1).each do |x|
  puts "+#{(Date.today + x).to_s} = #{(Date.today + x).casual(:as => as)}"
end
1.upto(max).each do |x|
  puts "-#{(Date.today - x).to_s} = #{(Date.today - x).casual(:as => as)}"
end