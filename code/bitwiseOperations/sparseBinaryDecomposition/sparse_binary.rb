# based on https://medium.com/rubycademy/ruby-bitwise-operators-da57763fa368
# returns true if a binary integer is sparse.

def sparse?(int)
  result = int & (int >> 1)
  result.zero?
end

# Not optimal solution for really big numbers.
# returns first integer that matches with another
# one to be a sparse decomposition.

def sparse_decomposition(int)
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

# Return a complete set of sparse binary decomposition
# of a number. This is a memory killer for big numbers.
# This is an extra method made it just for fun.

def full_sparse_decomposition(int)
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
