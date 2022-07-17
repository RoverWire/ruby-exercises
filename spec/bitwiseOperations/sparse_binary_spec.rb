require 'spec_helper'
require_relative '../../code/bitwiseOperations/sparseBinaryDecomposition/sparse_binary'

describe '#sparse?' do
  it 'returns true if the binary representation of the number is a sparse' do
    expect(sparse?(41)).to be true
  end

  it 'returns false if the binary representation of the number is not a sparse' do
    expect(sparse?(26)).to be false
  end
end

describe '#sparse_decomposition' do
  it 'returns an integer' do
    expect(sparse_decomposition(26)).to be_a(Integer)
  end

  it 'returns a sparse decomposition number' do
    expect([16, 10, 17, 9, 18, 8, 21, 5]).to include(sparse_decomposition(26))
  end
end

describe '#full_sparse_decomposition' do
  it 'returns an array of sets of sparse binary decomposition numbers' do
    expect(full_sparse_decomposition(26)).to match_array([[16, 10], [17, 9], [18, 8], [21, 5]])
  end
end
