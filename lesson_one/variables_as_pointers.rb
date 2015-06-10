a = "hi there"
puts "a is #{a}"

# this says: b should point to the same thing that a is pointing to
b = a

# gsub! is changing the acutal thing that a is refering to
# it is not telling a to point to something else
a.gsub!(" ", "_")
puts "just changed a"
puts "a is #{a}"
puts "b is #{b}"

a = 'hi there'
# b: point to the 'hi there object in memory' 
b = a 
# a: point to something else 
a = [1, 2, 3] 
# b should still be pointing to the 'hi there' object
puts b
