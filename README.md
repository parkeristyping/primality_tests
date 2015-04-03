# Flatiron primality tests

This is a collection of primality test algorithms written in Ruby.

All files in the primality_tests directory are of the form "name_of_primality_test.rb" and contain the function name_of_primality_test(n), where n is expected to be a positive integer.

So, for the Miller-Rabin primality test, the file is called "miller_rabin.rb" and the contained function that determines if some positive integer n is prime is called "miller_rabin(n)". This convention must be followed for any new tests added.

I encourage you to add your own primality tests! And please feel free to submit pull requests.

# Benchmarking

The file "benchmarking.rb" can be used to perform benchmarking of the primality tests against one another. By default, the benchmarking test does the following:

1. Calls primality test on static list of 100 primes (max 10 digits)
2. Calls primality test on static list of 100
3. Returns benchmarking values and pass/fail

Alternatively, the user can define a custom test:

1. Generate (user input) random integers '2..(user input)', stored statically as array
2. For each test specified by user, runs that test's prime function for each member of the array of ints.
3. Compares result to trial division to test for accuracy and produce pass/fail

Note that in the custom test, trial division is always performed, as it is used to check the output from other 

So, to run the tests on your machine:

1. Download this repo
2. Add any primality tests you want to benchmark to the primality_tests directory (NOTE: As explained above, be sure that 'prime?(n)' is defined as 'name_of_primality_test(n)' and file is 'name_of_primality_test.rb')
3. Run 'benchmarking.rb'

TODO:
* Clean up my messy hash structure.
* Format benchmarking output as human readable.
* Add accuracy check by checking each method against some method that has been demonstrated to be accurate