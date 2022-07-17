require 'spec_helper'
require_relative '../../code/bitwiseOperations/sparseBinaryDecomposition/sparse_binary_optimized'

describe '#calculate_alternating_mask' do
  it 'calculates the alternating mask of an decimal integer' do
    expect(calculate_alternating_mask(15)).to eq(-0b110)
  end

  it 'calculates the alternating mask of a binary' do
    expect(calculate_alternating_mask(0b1111)).to eq(-0b110)
  end

  it 'calculates the alternating mask of a hexadecimal' do
    expect(calculate_alternating_mask(0xf)).to eq(-0b110)
  end
end

describe '#sparse_decomposition_optimized' do
  it 'calculates sparse decomposition of small numbers' do
    expect([1, 2]).to include(sparse_decomposition_optimized(3))
    expect([4, 2]).to include(sparse_decomposition_optimized(4))
    expect([16, 10, 17, 9, 18, 8, 21, 5]).to include(sparse_decomposition_optimized(26))
  end

  it 'calculates sparse decomposition of big numbers' do
    expect(sparse_decomposition_optimized(74_901_729)).to eq 72_630_337
    expect(sparse_decomposition_optimized(216_188_401)).to eq 144_867_488
    expect(sparse_decomposition_optimized(1_000_000_000)).to eq 713_722_368
  end
end
