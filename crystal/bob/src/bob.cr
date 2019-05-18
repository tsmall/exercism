module Bob
  def self.hey(message)
    bob.reply_to(message)
  end

  private def self.bob
    @@bob ||= Person.new
  end
end


class Person
  def initialize
    @mood = Moods.neutral
  end

  def reply_to(message)
    react_to(message)
    respond
  end

  private def react_to(message)
    @mood = Moods.matching(message)
  end

  private def respond
    @mood.response
  end
end


module Moods
  @@all_moods = [] of Mood

  def self.alarmed
    Mood.new("Whoa, chill out!") { |message|
      letters = message.chars.select(&.letter?)
      !letters.empty? && letters.all?(&.uppercase?)
    }
  end

  def self.neutral
    Mood.new("Whatever.") { |message| true }
  end

  def self.unhelpful
    Mood.new("Sure.") { |message| message.ends_with?('?') }
  end

  def self.defensive
    Mood.new("Calm down, I know what I'm doing!") { |message|
      letters = message.chars.select(&.letter?)
      all_uppercase = !letters.empty? && letters.all?(&.uppercase?)
      all_uppercase && message.ends_with?('?')
    }
  end

  def self.belligerant
    Mood.new("Fine. Be that way!") { |message|
      message.chars.all?(&.whitespace?)
    }
  end

  def self.matching(message)
    all_moods.find(neutral) do |mood|
      mood.triggered_by? message
    end
  end

  private def self.all_moods
    if @@all_moods.empty?
      # Note: The order these are added to the array matters.
      @@all_moods << belligerant
      @@all_moods << defensive
      @@all_moods << unhelpful
      @@all_moods << alarmed
      @@all_moods << neutral
    end

    @@all_moods
  end
end


class Mood
  getter response : String

  def initialize(@response : String, &triggered_by : String -> Bool)
    @trigger_test = triggered_by
  end

  def triggered_by?(message)
    @trigger_test.call(message)
  end
end
