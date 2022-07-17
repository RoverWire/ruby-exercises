require 'spec_helper'
require_relative '../../code/bitwiseOperations/binaryGap/binary_gap'

describe '#binary_gap' do
  it 'returns the length of the binary gap of 9 (1001)' do
    expect(binary_gap(9)).to eq 2
  end

  it 'returns the length of the binary gap of 1041 (10000010001)' do
    expect(binary_gap(1041)).to eq 5
  end

  it 'returns zero when no binary gap is found (100000)' do
    expect(binary_gap(32)).to eq 0
  end
end
