# Flatiron primality tests

This is a collection of primality test algorithms written in Ruby.

All files in the primality_tests directory are of the form "name_of_primality_test.rb" and contain the function name_of_primality_test(n), where n is expected to be a positive integer.

So, for the Miller-Rabin primality test, the file is called "miller_rabin.rb" and the contained function that determines if some positive integer n is prime is called "miller_rabin(n)". This convention must be followed for any new tests added.

I encourage you to add your own primality tests! And please feel free to submit pull requests.

# Benchmarking

The file "benchmarking.rb" can be used to perform benchmarking of the primality tests against one another. By default, the benchmarking test does the following:

1. Generates (user input) random integers 2..(user input), stored statically as array

2. For each test specified by user, runs that test's prime function for each member of the array of ints.

So, to run the tests on your machine:

1. Download this repo

2. Add any algorithms you want to the primality_tests directory (NOTE: As explained above, be sure that 'prime?(n)' is defined as 'name_of_primality_test(n)' and file is 'name_of_primality_test.rb')

3. Run 'benchmarking.rb'

TODO: Clean up my messy hash structure!\
TODO: Format benchmarking output as human readable.
TODO: Add accuracy check by checking each method against some method that has been demonstrated to be accurate