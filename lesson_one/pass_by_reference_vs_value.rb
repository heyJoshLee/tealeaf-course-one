=begin
Pass by reference vs value

Create a method that takes an array as a parameter. 
Within that method, try calling methods that do not mutate 
the caller. How does that affect the array outside of the method? 
What about when you call a method that mutates the caller within 
the method?

Example:

def my_method(arr)
  arr.uniq
end

my_arr = [1, 2, 2, 3]
my_method(my_arr)
puts my_arr # => was the outer scope array affected by the 
method invocation?



=end

my_array = ["a", "b", "b", "d", "c"]
def mod_array(arr)
  puts "Reverse the array"
  puts arr.reverse
  puts "Sort the array"
  puts arr.sort
  puts "Sort the array then reverse!"
  puts arr.sort.reverse
  puts "Remove non unique values"
  puts arr.uniq
  puts "Array is still intact"
  p arr
end

def mod_array!(arr)
  puts "Original array"
  p arr
  puts "What do you want to do the the array"
  puts "1) reverse 2) sort 3) sort then reverse 4) remove non unique vales"
  input = gets.chomp
  case input
  when "1"
    arr.reverse!
  when "2"
    arr.sort!
  when "3"
    arr.sort.reverse!
  when "4"
    arr.uniq!
  end
  puts "Array has been changed. Exiting function"
end

mod_array!(my_array)

p my_array