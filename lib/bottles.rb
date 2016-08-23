class Bottles

  def verse(bottles)
    Verse.new(bottles).to_s
  end

  def verses(bottles_from, bottles_to)
    Song.new(bottles_from, bottles_to).to_s
  end

  def song
    Song.new.to_s
  end

end

class Song

  def initialize(bottles_from=99, bottles_to=0)
    @verses = bottles_from..bottles_to.map { |bottles| Verse.new(bottles).to_s }
  end

  def to_s
    verses.join("\n\n")
  end

  private

  attr_reader :verses

end

class Verse

  def initialize(initial_bottles)
    @initial_bottles = initial_bottles
  end

  def to_s
    <<-VERSE
#{first_line}
#{second_line}
    VERSE
  end

  private

  attr_reader :initial_bottles

  def first_line
    Setting.new(initial_bottles).to_s
  end

  def second_line
    ActionAndOutcome.new(initial_bottles).to_s
  end

end

module Humanizable

  private

  def humanized_bottles
    "#{humanized_number} #{humanized_subject}"
  end

  def humanized_bottles_on_the_wall
    "#{humanized_bottles} on the wall"
  end

  def humanized_subject
    if bottles == 1
      "bottle of beer"
    else
      "bottles of beer"
    end
  end

  def humanized_number
    if bottles == 0
      "no more"
    else
      bottles.to_s
    end
  end

end

class Setting

  include Humanizable

  def initialize(bottles)
    @bottles = bottles
  end

  def to_s
    to_sentence
  end

  private

  attr_reader :bottles

  def to_sentence
    "#{humanized_bottles_on_the_wall.capitalize}, #{humanized_bottles}."
  end

end

class ActionAndOutcome

  include Humanizable

  def initialize(bottles)
    @bottles = bottles
  end

  def to_s
    to_sentence
  end

  private

  attr_reader :bottles

  def to_sentence
    "#{action}, #{outcome}."
  end

  def action
    if bottles > 0
      take_one
    else
      fill_up
    end
  end

  def take_one
    "Take #{bottles == 1 ? "it" : "one"} down and pass it around".tap do
      @bottles = bottles - 1
    end
  end

  def fill_up
    "Go to the store and buy some more".tap do
      @bottles = 99
    end
  end

  def outcome
    humanized_bottles_on_the_wall
  end

end
