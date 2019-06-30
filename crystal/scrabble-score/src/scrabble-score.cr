module ScrabbleScore
  extend self

  def score(word)
    ScrabbleWord.new(word).score
  end
end

class ScrabbleWord
  private getter raw : String

  def initialize(string)
    @raw = string.downcase
  end

  def score
    scores.sum
  end

  private def scores
    letters.map(&.score)
  end

  private def letters
    raw.chars.map do |char|
      ScrabbleTile.new(char)
    end
  end
end

class ScrabbleTile
  private getter letter : Char

  @@value_of = {
    'a' => 1, 'b' => 3, 'c' => 3, 'd' => 2, 'e' => 1,  'f' => 4,
    'g' => 2, 'h' => 4, 'i' => 1, 'j' => 8, 'k' => 5,  'l' => 1,
    'm' => 3, 'n' => 1, 'o' => 1, 'p' => 3, 'q' => 10, 'r' => 1,
    's' => 1, 't' => 1, 'u' => 1, 'v' => 4, 'w' => 4,  'x' => 8,
    'y' => 4, 'z' => 10
  }

  def initialize(char)
    @letter = char
  end

  def score
    @@value_of[letter]
  end
end
