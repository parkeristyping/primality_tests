# Miller-Rabin algorithm
# Source (pseudocode): http://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
# Author: Parker Lawrence

def is_integer?(n)
  (n - n.to_i).abs < 0.0000001
end

def miller_rabin_prime?(n,k)
  # for any odd n > 2
  return false if n.even? || n <= 1
  
  # write n − 1 as 2s·d with d odd by factoring powers of 2 from n − 1
  max_s = (Math::log(n,2)).floor
  range = (1..max_s).to_a
  range.reverse!
  range.map {|x| x.to_f}

  s, d = range.inject([]) do |memo, s|
    i = ((n-1) / 2**s.to_f)
    memo = [s.to_f, i] if is_integer?(i) && memo == []
    memo
  end

  # loop k times
  (0..k).each do
    # pick a randomly in the range [2, n - 1]
    a = rand(2..(n-1))

    # set x = a^d mod n
    x = a**d.to_i % n

    if !(x == 1 || x == n-1)
      x = (1..([1,(s-1)].max)).inject(x) do |x|
        x = x**2 % n if x
        return false if x == 1
        x if x != n-1
      end
      return false if x != nil
    end
  end
  return true
end

# Implement with k = 5
def miller_rabin(n)
  miller_rabin_prime?(n,5)
end
