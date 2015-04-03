# Ruby code to benchmark prime tests
# Author: Parker Lawrence

require 'benchmark'
require 'pry'

# Determine what tests user wants to run
test_names = []
Dir.foreach('./primality_tests') do |current_test_dot_rb|
  current_test = current_test_dot_rb.chomp('.rb')
  if current_test != current_test_dot_rb
    test_names << current_test.to_s
  end
end

tests = {}
test_names.each {|current_test|
  puts "Would you like to test #{current_test}? (y/n)"
  result = gets.chomp
  result == "y" ? test = true : test = false
  tests[current_test.to_sym] = {name: current_test, test?: test}
}

# Gather other information from user
puts "How many ints to test?"
num_ints_to_test = gets.chomp.to_i
puts "Largest possible int to test?"
max_int_to_test = gets.chomp.to_i

# Generate array of ints to test
ints_to_test = []
range = (1..num_ints_to_test)
(1..num_ints_to_test).each {|i|
  ints_to_test << rand(2..max_int_to_test)
}

# Manual addition
puts ints_to_test.inspect

add_num = true
while add_num
  puts "Would you like to add a specific number? (y/n)"
  answer = gets.chomp
  if answer == "y"
    puts "Enter number:"
    ints_to_test << gets.chomp.to_i
  else
    add_num = false
  end
end

# run a test given test name
def run_test(tests, ints_to_test, current_test_name)
  require "./primality_tests/" + current_test_name + ".rb"
  tests[current_test_name.to_sym][:result] = []
  ints_to_test.each {|int|
    tests[current_test_name.to_sym][:result] << send(current_test_name, int)
  }
end

# benchmark all selected tests
tests.each {|current_test|
  if current_test[1][:test?]
    current_test[1][:benchmark] = []
    current_test[1][:benchmark] = Benchmark.measure {run_test(tests, ints_to_test, current_test[1][:name])}
  end
  puts "#{current_test[1][:name]} >>> #{current_test[1][:benchmark]}"
}

binding.pry
