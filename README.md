# Flatiron primality tests

This is a collection of primality test algorithms written in Ruby.

All files in the primality_tests directory are of the form "name_of_primality_test.rb" and contain the function name_of_primality_test(n), where n is expected to be a positive integer.

So, for the Miller-Rabin primality test, the file is called "miller_rabin.rb" and the contained function that determines if some positive integer n is prime is called "miller_rabin(n)". This convention must be followed for any new tests added.

I encourage you to add your own primality tests! And please feel free to submit pull requests.

# Benchmarking

The file "benchmarking.rb" can be used to perform benchmarking of the primality tests against one another. By default, the benchmarking test does the following:

1. Generate test sample of user-input number of random primes and composites in range '1..(user input)'
2. For each primality test selected by the user, run that test's prime function for each member of the sample generated in step 1
3. For each primality test, output real elapsed time, as well as whether or not the test correctly identified primes and composites for the tested sample

So, to run the tests on your machine:

1. Download this repo
2. Add any primality tests you want to benchmark to the primality_tests directory (NOTE: As explained above, be sure that 'prime?(n)' is defined as 'name_of_primality_test(n)' and file is 'name_of_primality_test.rb')
3. Run 'benchmarking.rb'

TODO:
* Clean up my messy hash structure.