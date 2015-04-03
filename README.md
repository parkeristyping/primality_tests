# Flatiron primality tests

This is a collection of primality test algorithms written in Ruby by students of the Flatiron School.

All files in the primality_tests folders are of the form "<algorithm_name>.rb" and contain the function <algorithm_name>(n), where n is expected to be a positive integer.

So, for the miller_rabin test, the file is called "miller_rabin.rb" and the function within miller_rabin that determines if some positive integer n is prime is called "miller_rabin(n)". This convention must be followed for any new tests added.

# Benchmarking

The file "benchmarking.rb" can be used to perform benchmarking of the primality tests against one another. By default, the benchmarking test does the following:

- Generates (user input) random integers 2..(user input), stored statically as array
- For each test specified by user, runs that test's prime function for each member of the array of ints.

TODO: Add accuracy check by checking each method against some method that has been demonstrated to be accurate