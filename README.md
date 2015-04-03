# Flatiron primality tests

This is a collection of primality test algorithms written in Ruby.

All files in the primality_tests directory are of the form "<algorithm_name>.rb" and contain the function <algorithm_name>(n), where n is expected to be a positive integer.

So, for the miller_rabin test, the file is called "miller_rabin.rb" and the function within miller_rabin that determines if some positive integer n is prime is called "miller_rabin(n)". This convention must be followed for any new tests added.

I encourage you to follow this convention and add your own prime algorithms! Please submit pull requests so that everyone can see.

# Benchmarking

The file "benchmarking.rb" can be used to perform benchmarking of the primality tests against one another. By default, the benchmarking test does the following:
1. Generates (user input) random integers 2..(user input), stored statically as array
2. For each test specified by user, runs that test's prime function for each member of the array of ints.

So, to run the tests on your machine:
1. Download this repo
2. Add any algorithms you want to the primality_tests directory (NOTE: As explained above, be sure that 'prime?(n)' is defined as 'name_of_primality_test(n)' and file is 'name_of_primality_test.rb')
3. Run 'benchmarking.rb'

TODO: Clean up my messy hash structure!
TODO: Format benchmarking output as human readable.
TODO: Add accuracy check by checking each method against some method that has been demonstrated to be accurate