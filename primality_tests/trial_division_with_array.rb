def trial_division_with_array (num)
  known_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
  if known_primes.include?(num)
    return true
  end
  known_primes.each do |prime|
    # puts "tried this"
    if num%prime == 0
      return false
    end
  end
  for i in known_primes.last..Math.sqrt(num).floor
    # puts "tried this #{i} times"
    if num%i == 0
      return false
    end
  end
  true
end