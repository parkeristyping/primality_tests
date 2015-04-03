# Ruby code to benchmark prime tests
# Author: Parker Lawrence

# Determine what tests user wants to run
test_names = []
Dir.foreach('./primality_tests') do |current_test|
  if current_test.split(//).last(3).join("").to_s == '.rb'
    test_names << current_test.to_s
  end
end

tests = [{}]
test_names.inject(0) {|i, current_test|
  puts "Would you like to test #{current_test}? (y/n)"
  result = gets.chomp
  result == "y" ? test = true : test = false
  tests[i] = {name: current_test, test?: test}
  i += 1
} 
# At this point, tests #=> [{:name => miller-rabin, :test? => true},...]

# 