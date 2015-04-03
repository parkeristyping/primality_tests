# Ruby code to benchmark prime tests
# Author: Parker Lawrence

require 'benchmark'
require 'prime'
require 'pry'

# Set list of primes
prime_list = Prime.take(100000)
composite_list = []

prime_list.inject(1) do |start, prime|
  if start != prime
    ((start..(prime-1)).to_a).each {|i|
      composite_list << i
    }
  end
  prime + 1
end

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
puts "How many random primes to test?"
num_primes_to_test = gets.chomp.to_i
puts "How many random composites to test?"
num_composites_to_test = gets.chomp.to_i
puts "Set a max value? (y/n)"
if gets.chomp == "y"
  puts "What is the max value?"
  max_value = gets.chomp.to_i
end

# Apply max_value
if max_value
  prime_list.collect! {|n| n if n <= max_value}
  composite_list.collect! {|n| n if n <= max_value}
end

# Generate array of ints to test
primes_to_test = []
composites_to_test = []
(1..num_primes_to_test).each {primes_to_test << prime_list.sample}
(1..num_composites_to_test).each {composites_to_test << composite_list.sample}

# run a test given test name
def run_test(tests, primes_to_test, composites_to_test, current_test_name)
  require "./primality_tests/" + current_test_name + ".rb"
  tests[current_test_name.to_sym][:result] = []
  tests[current_test_name.to_sym][:prime_pass?] = true
  tests[current_test_name.to_sym][:composite_pass?] = true
  primes_to_test.each {|i|
    result = send(current_test_name, i)
    tests[current_test_name.to_sym][:result] << result
    tests[current_test_name.to_sym][:prime_pass?] = false unless result
  }
  composites_to_test.each {|i|
    result = send(current_test_name, i)
    tests[current_test_name.to_sym][:result] << result
    tests[current_test_name.to_sym][:composite_pass?] = false if result
  }
end

# benchmark all selected tests
tests.each {|current_test|
  if current_test[1][:test?]
    current_test[1][:benchmark] = []
    current_test[1][:benchmark] = Benchmark.measure {run_test(tests, primes_to_test, composites_to_test, current_test[1][:name])}
    puts "#{current_test[1][:name]} >>> Seconds elapsed: #{current_test[1][:benchmark].real.round(3)} >>> ID'ed all primes? #{current_test[1][:prime_pass?].to_s} >>> ID'ed all composites? #{current_test[1][:composite_pass?].to_s}"
  end
}
