# Sieve of Eratosthenes
# Source (pseudocode): http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
# Author: Adam Czerepinski

def sieve_of_eratosthenes(n)
  return true if n == 2
  return false if n.even? || n <= 1
    #create a list of consecutive integers 2..n
    array = [*0..n]
    #initially let p = 2
    p = 2
    while true
      i = p
      return true if array[p] == n
      #starting from p, enumerate its multiples 2p 3p 4p
      while i <= n
        array[i] = nil
        i = i + p
        return false if array[n] == nil
      end
      #find first number greater than p that is not marked. if there is no such number, stop.
      while p <= n
        p += 1
        break if array[p]
      end
  end
      return true
end

puts sieve_of_eratosthenes(2)
puts sieve_of_eratosthenes(25)
puts sieve_of_eratosthenes(1489)
puts sieve_of_eratosthenes(1485)