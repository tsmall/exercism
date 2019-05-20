module Forth
  extend self

  def evaluate(source)
    vm = ForthVM.new
    vm.evaluate(source)
    vm.stack
  end
end


class ForthVM
  def initialize
    @stack = [] of Int32
    @registry = {} of String => ForthWord

    define_builtin_words
  end

  private def define_builtin_words
    @registry["+"] = ForthWord.new do |stack, parser|
      stack.push( stack.pop + stack.pop )
    end

    @registry["-"] = ForthWord.new do |stack, parser|
      n2 = stack.pop
      n1 = stack.pop
      stack.push(n1 - n2)
    end

    @registry["*"] = ForthWord.new do |stack, parser|
      stack.push( stack.pop * stack.pop )
    end

    @registry["/"] = ForthWord.new do |stack, parser|
      n2 = stack.pop
      n1 = stack.pop
      stack.push(n1 / n2)
    end

    @registry["dup"] = ForthWord.new do |stack, parser|
      n = stack.pop
      stack.push(n)
      stack.push(n)
    end

    @registry["drop"] = ForthWord.new do |stack, parser|
      stack.pop
    end

    @registry["swap"] = ForthWord.new do |stack, parser|
      n2 = stack.pop
      n1 = stack.pop
      stack.push(n2)
      stack.push(n1)
    end

    @registry["over"] = ForthWord.new do |stack, parser|
      n2 = stack.pop
      n1 = stack.pop
      stack.push(n1)
      stack.push(n2)
      stack.push(n1)
    end

    @registry[":"] = ForthWord.new do |stack, parser|
      name = parser.next_word
      if ! name.to_i?.nil?
        raise "Cannot redefine numbers"
      end

      commands = parser.words_until(";")
      @registry[name.downcase] = ForthWord.new do |stack, parser|
        commands.each do |word|
          execute(word, parser)
        end
      end
    end
  end

  def evaluate(source)
    parser = ForthParser.new(source)
    parser.each_word do |word|
      execute(word, parser)
    end
  end

  private def execute(word, parser)
    forth_word =
      if ForthLiteral.matches? word
        ForthLiteral.new(word)
      else
        @registry[word.downcase]
      end

    forth_word.execute(@stack, parser)
  end

  def stack
    # Return a clone so the calling object isn't able to
    # modify my internal state.
    @stack.clone
  end
end


class ForthParser
  @iterator : Iterator(String)

  def initialize(source)
    words = source.split
    @iterator = words.each
  end

  def each_word
    @iterator.each do |word|
      yield word
    end
  end

  def next_word : String
    word = @iterator.next
    if word == Iterator::Stop::INSTANCE
      raise "Ran out of words!"
    end
    word.as(String)
  end

  def words_until(terminator : String) : Array(String)
    words = [] of String
    word = next_word
    until word == terminator
      words << word
      word = next_word
    end
    words
  end
end


class ForthWord
  def initialize(&logic : (Array(Int32), ForthParser) -> Nil)
    @logic = logic
  end

  def execute(stack, parser)
    @logic.call(stack, parser)
  end
end


class ForthLiteral
  def self.matches?(word : String) : Bool
    !word.to_i?.nil?
  end

  @number : Int32

  def initialize(word : String)
    @number = word.to_i
  end

  def execute(stack, parser)
    stack.push(@number)
  end
end
