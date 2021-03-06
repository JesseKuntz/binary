# binary.rb is a program that is able to convert from decimal to binary and vice versa.

input = 0.0
binary_number = ''

# binary_to_integer takes in a binary number as a string and prints the integer equivalent
def binary_to_integer(n)
  sum = 0
  temp = 0
  i = 0
  while i < n.length
    temp = n[i]
    if temp == '1'
      temp = temp.to_i
      sum += temp * 2**(n.length-i-1)
      i += 1
    elsif temp == '0'
      i += 1
    else
      puts 'You did not enter a valid binary number.'
      break
    end
  end
  print 'Integer: '
  puts sum
end

def integer_to_binary(n)
  # check to see if the number is even or odd
  even = false
  if n % 2 == 0
    even = true
  else
    # will need to subtract this '1' later
    n += 1
  end

  # get the size of the array by seeing how many times it needs to be divided
  size = 1
  temp = n
  while temp >= 2
    temp /= 2
    size += 1
  end
  # subtract that '1' that was previously added
  if !even
    n -= 1
  end

  # get the bits of the bit string and put them in an array
  bits = Array.new(size)
  i = 0
  while n > 0
    bits[i] = n % 2
    n /= 2
    i += 1
  end

  # print out the bit string backward
  print 'Binary: '
  i = bits.count - 1
  while i >= 0
    print bits[i]
    i -= 1
  end
  puts ''
end

puts '1. Convert from integer to binary. (no negative integers)'
puts '2. Convert from binary to integer.'
print 'Choose one: '
choice = gets.to_i
# calculate and print the binary equivalent
if choice == 1 then
  print 'Enter an integer: '
  input = gets.to_i
  integer_to_binary input
# calculate and print the integer equivalent
elsif choice == 2 then
  print 'Enter a binary number: '
  input = gets.chomp
  binary_to_integer input
# neither a 1 nor a 2 was entered
else
  puts 'You did not enter a valid choice.'
end



