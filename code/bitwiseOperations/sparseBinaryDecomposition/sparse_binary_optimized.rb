# calculate_alternating_mask determines a binary mask with a maximum
# range based on the provided value, then iterates through each bit in
# the mask, alternating the setting of that bit to 0.
#
# the end result is a mask with at most every other bit set to 1, in the
# worst case scenario that all bits were 1 in the binary representation
# of the input value.

def calculate_alternating_mask(value)
  binary_index = Math.log2(value).ceil
  alternating_mask = (2**binary_index) - 1
  zero_bit = 1

  while binary_index >= 0
    alternating_mask -= 2**binary_index if zero_bit == 1
    zero_bit ^= 0b1
    binary_index -= 1
  end

  alternating_mask
end

# This solution works with big integers, we
# assume that 0 and 1 are sparse, so this
# method avoids to check those numbers

def sparse_decomposition_optimized(value)
  return value if value <= 2

  value & calculate_alternating_mask(value)
end
