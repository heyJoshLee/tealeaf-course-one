# 1. string interpoliation vs concat
# 2. extract repetitive logic to methods

# want to aviod converting raw data
# use pry instead of srpaying app with print outs
# pry allows me to check and change varibles 
require 'pry'

def say (msg)
  puts "=> #{msg}"
end

say "What's the first numnber?"
num1 = gets.chomp

say "What's the second numnber?"
num2 = gets.chomp

say "1) add 2) subtract 3) multiply 4) divide"

operator = gets.chomp

#binding.pry

puts "Numbers: #{num1} #{num2}. You chose to #{operator}"

if operator == "1"
  result = num1.to_i + num2.to_i
elsif operator == "2"
  result = num1.to_i - num2.to_i
elsif operator == "3"
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f
end

puts "Result is #{result}"





