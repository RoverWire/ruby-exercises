# rubocop:disable Style/FrozenStringLiteralComment, Lint/MissingCopEnableDirective, Style/BlockComments
=begin
A non-negative integer N is called sparse if its binary
representation does not contain two consecutive bits set
to 1. For example, 41 is sparse, because its binary representation
is "101001" and it does not contain two consecutive 1s. On the
other hand, 26 is not sparse, because its binary representation
is "11010" and it contains two consecutive 1s.

Two non-negative integers P and Q are called a sparse decomposition
of integer N if P and Q are sparse and N = P + Q.

For example:

8 and 18 are a sparse decomposition of 26 (binary representation of 8 is "1000", binary representation of 18 is "10010");
9 and 17 are a sparse decomposition of 26 (binary representation of 9 is "1001", binary representation of 17 is "10001");
2 and 24 are not a sparse decomposition of 26; though 2 + 24 = 26, the binary representation of 24 is "11000", which is not sparse.

Write a function:

def solution(n)

that, given a non-negative integer N, returns any integer
that is one part of a sparse decomposition of N. The function
should return −1 if there is no sparse decomposition of N.

For example, given N = 26 the function may return 8, 9, 17 or 18,
as explained in the example above. All other possible results for
N = 26 are 5, 10, 16 and 21.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [0..1,000,000,000].

https://medium.com/rubycademy/ruby-bitwise-operators-da57763fa368

test = 16
puts test.to_s(2)
puts (test >> 1).to_s(2)
puts (test >> 1) & test

=end

def sparse?(int)
  result = int & (int >> 1)
  result.zero?
end

def sparse_decomposition(int)
  start = (int / 2).ceil
  sparse = []

  start.downto(1) do |number|
    if sparse?(number)
      sustract = int - number
      sparse << [sustract, number] if sparse?(sustract)
    end
  end

  sparse
end

=begin
# Not optimal solution
def sparse_decomposition_integer(int)
  return int if sparse?(int)

  limit = (int / 2).ceil
  1.upto(limit) do |number|
    if sparse?(number)
      sustract = int - number
      return number if sparse?(sustract)
    end
  end

  -1
end
=end

def calculate_alternating_mask(value)
=begin
    calculate_alternating_mask determines a binary mask with a maximum
    range based on the provided value, then iterates through each bit in
    the mask, alternating the setting of that bit to 0.

    the end result is a mask with at most every other bit set to 1, in the
    worst case scenario that all bits were 1 in the binary representation
    of the input value.

    @example: calculate_alternating_mask(15) -> 0b1010
    @example: calculate_alternating_mask(0b1111) -> 0b1010
    @example: calculate_alternating_mask(0xf) -> 0b1010

    @example: calculate_alternating_mask(255) -> 0b10101010
    @example: calculate_alternating_mask(0b11111111) -> 0b10101010
    @example: calculate_alternating_mask(0xff) -> 0b10101010
=end

  binary_index = Math.log2(value).ceil
  alternating_mask = 2**binary_index - 1
  zero_bit = 1

  while binary_index >= 0
    alternating_mask -= 2**binary_index if zero_bit == 1
    zero_bit ^= 0b1
    binary_index -= 1
  end

  alternating_mask
end

def sparse_decomposition_integer(value)
  return value if value <= 2

  value & calculate_alternating_mask(value)
end

# Asserts

puts sparse?(41)
puts sparse?(26) == false
puts sparse?(24) == false

puts [16, 10, 17, 9, 18, 8, 21, 5].include? sparse_decomposition_integer(26)

puts sparse_decomposition_integer(0).zero? == true
puts sparse_decomposition_integer(1) == 1
puts sparse_decomposition_integer(2) == 2
puts [1, 2].include? sparse_decomposition_integer(3)
puts [4, 2].include? sparse_decomposition_integer(4)

puts sparse_decomposition_integer(74_901_729)
puts sparse_decomposition_integer(216_188_401)
puts sparse_decomposition_integer(536_870_912)
puts sparse_decomposition_integer(1_000_000_000)
