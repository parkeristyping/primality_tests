# Flatiron primality tests

This is a collection of primality test algorithms written in Ruby by students of the Flatiron School.

All files in the primality_tests folders are of the form "<algorithm_name>.rb" and contain the function prime?(n), where n is expected to be a positive integer.

# Benchmarking

The file "benchmarking.rb" can be used to perform benchmarking of the primality tests against one another. By default, the benchmarking test does the following:

- Generates k (user input) random integers 2..max(use input), stored statically as array X
- Uses Ruby's built in Math::prime? function to determine primality of each generated integer and built-in benchmark
- For each test specified by user, determines primality of each member of X and benchmark. Then compares results to Math::prime? to ensure accuracy