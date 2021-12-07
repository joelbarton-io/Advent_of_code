# Day 3: Binary Diagnostic

=begin
PART 1

- We are asked to determine power consumption (gamma * epsilon) based on the puzzle input.  

Questions:
- what if the zero bits and one bits are equal?
Once we've made the data usable...

algo: basically a nested loop
- 5 values we care about based on X input

- declare storage array to hold eventual gamma values
- iterate 5 times, once for each position in sub array
- for each time, iterate over entire array at a specific sub array index
  - increment gamma values at specific indexes

- once gamma is generated,
- the inverse will be epsilon

then, we will use bitwise to figure out what each is in decimal representation and multiply g * e for power consumption







=end

raw = '00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010'

=begin
PART 2

* CO2 rating: least common at bit position, if equal, keep numbers with 0 in current bit position
steps
- start by considering the first bit of each number
- select those full numbers that meet the bit criteria:
- if there is only one number left, stop, this is what we want
- otherwise, repeat the process w the next column (bit)

*oxygen rating: most common at bit position, if equal, keep numbers with 1 in current bit position


example:
data[0][0] = 0 or 1

=end
data = raw.split(' ')

index = 0
until index == 4 do
  zeros = 0
  ones = 0
  data.each { |el| el[index] == '0' ? zeros += 1 : ones += 1 }

  if zeros == ones 
  zeros > ones ? : 
  index += 1
end



















=begin 

PART 1

data = raw.split(' ')
gamma_array = []
index = 0

loop do
  break if index > 11

  zeros = 0
  ones = 0
  data.each { |el| el[index] == '0' ? zeros += 1 : ones += 1 }
  zeros > ones ? gamma_array.push(0) : gamma_array.push(1) # doesn't account for situations where zeros == ones

  index += 1
end

epsilon_array = gamma_array.map do |el|
  el == 0 ? 1 : 0
end

# reversing the array and working left to right makes things more synchronous bc we are using indexes in our calculations

def bin_to_dec(bin_arr)
  result = 0 
  index = 0
  rev_bin_arr = bin_arr.reverse

  until index == rev_bin_arr.size do
    index == 0 ? to_add = 1 : to_add = 2**(index)
    result += to_add if rev_bin_arr[index] == 1
    index += 1
  end
  result
end

gamma = bin_to_dec(gamma_array)
epsilon = bin_to_dec(epsilon_array)
power_consumption = gamma * epsilon 
p power_consumption
=end
