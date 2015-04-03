def trial_division (num)
  for i in 2..Math.sqrt(num).floor
    # puts "tried this #{i} times"
    if num%i == 0
      return false
    end
  end
  true
end