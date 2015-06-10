puts "1: Create a local variable and modify it at an "
puts "inner scope. You can try:"
puts "a) re-assigning the variable to something else\n"

local_var = "local_var"

puts "local_var before the block is ran is:  #{local_var}"

loop do 
  local_var = "new_value!"
  break
end

puts "local_var after the block is ran is:  #{local_var}"

puts "b) call a method that doesn’t mutate the caller\n"

def no_mutate(arr)
  arr.uniq
end

my_arr = [1,2,2,3]

puts "my_arr is #{my_arr}\n\n"
puts "Run function that doesn't mutate it"
no_mutate(my_arr)
puts my_arr

def yes_mutate(arr)
  arr.uniq!
end
puts "Then run a function that does change it"
yes_mutate(my_arr)
puts my_arr


# created this function to show how to change a
# var that is a string in the global scope
my_string = "original string"
def change_string(a)
  puts "This is the string before: #{a}"
  a.gsub!(a, "new string")
  puts "This is the string after: #{a}"
end

change_string(my_string)
puts "outside in the global scope: #{my_string}"

# 2 Create a local variable at an inner scope and try to 
# reference it in the outer scope. What happens when you 
# have nested do/end blocks? Perform similar code 
# experiments as outlined in #1. Make sure to take your 
# time to play around with different scenarios here.

var_outer = "outer_scope"
def scope_function
  puts "starting the scope_function"
  # the below will throw an error
  # however if I make this function accept an argument
  # I can pass the argument through the function and
  # then have access to it
  puts "#{var_outer} is accessible"
  1.times do
    var_a = "var_a"
    1.times do
      # this is fine
      puts "var_a is #{var_a}"
      var_b = "var_b"
    end
    # this will throw an error becuase var_b is not inside this 
    # scope. It's one level in 
    puts "var_b is #{var_b}"
  end
end

x = "hi"

def my_method
  puts x
end

# my method will throw an error unless I write it like this

def my_method2(a)
  puts a 
end
my_method2(x)

