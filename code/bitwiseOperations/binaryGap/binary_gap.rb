# rubocop:disable Metrics/MethodLength
# Rubocop flags this as "method has too many lines"

def binary_gap(int)
  binary = int.to_s(2).chars.map(&:to_i)
  count = max_gap = 0

  binary.each do |digit|
    if digit.zero?
      count += 1
    else
      max_gap = count if count > max_gap
      count = 0
    end
  end

  max_gap
end

# rubocop:enable Metrics/MethodLength
