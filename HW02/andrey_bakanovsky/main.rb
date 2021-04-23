
require_relative "hw02.rb"

using Enumerable_Refine

puts a = [1, 2, 3, 4]
puts 'my_map:'
b = a.my_map { |x| x**3}
puts b
puts 'my_select:'
puts a.my_select { |x| x.even?}
puts 'my_each:'
a.my_each { |y| puts y*2 }
# p a
# p b