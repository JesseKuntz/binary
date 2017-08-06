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
      return 'You did not enter a valid binary number.'
      break
    end
  end
  return 'Integer Result: ' + sum.to_s
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

  # build the bit string backward
  i = bits.count - 1
  result = ''
  while i >= 0
    result = result + bits[i].to_s
    i -= 1
  end
  return 'Binary Result: ' + result
end

Shoes.app(width: 400, height: 250) do
  background "#213"
    border("#1CA",
           strokewidth: 6)
  stack(margin: 12) do
    para "Enter a binary number:", stroke: "#1CA"
    flow do
      @binaryBox = edit_line
      @toInteger = button "Convert to integer"
    end
    para "Enter an integer:", stroke: "#1CA"
    flow do
      @integerBox = edit_line
      @toBinary = button "Convert to binary"
    end
    @result = para "Result:", stroke: "#1CA"
  end
  @toInteger.click {
    int_conversion = binary_to_integer @binaryBox.text
    @result.replace int_conversion
  }
  @toBinary.click {
    bin_conversion = integer_to_binary @integerBox.text.to_i
    @result.replace bin_conversion
  }
end
