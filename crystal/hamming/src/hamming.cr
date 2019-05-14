module Hamming
  extend self

  def compute(strand_a, strand_b)
    if strand_a.size != strand_b.size
      raise ArgumentError.new("Strands must be the same length")
    end

    difference = 0
    strand_a.each_char.zip(strand_b.each_char).each do |a, b|
      difference += 1 if a != b
    end
    difference
  end

end
