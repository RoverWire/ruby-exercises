def calculate_alternating_mask(value)
  binary_index = Math.log2(value).ceil
  alternating_mask = 2**(binary_index - 1)
  zero_bit = 1

  while binary_index >= 0
    alternating_mask -= 2**binary_index if zero_bit == 1
    zero_bit ^= 0b1
    binary_index -= 1
  end

  alternating_mask
end

def sparse_decomposition_optimized(value)
  return value if value <= 2

  value & calculate_alternating_mask(value)
end
