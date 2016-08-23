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
    FirstLine.new(initial_bottles).to_s
  end

  def second_line
    SecondLine.new(initial_bottles - 1).to_s
  end

end

class Line

  def initialize(bottles)
    @bottles = bottles
  end

  private

  attr_reader :bottles

  def humanized_bottles
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

class FirstLine < Line

  def to_s
    "#{humanized_number.capitalize} #{humanized_bottles} on the wall, #{humanized_number} #{humanized_bottles}."
  end

end

class SecondLine < Line

  def to_s
    [action, remaining_bottles].join(", ")
  end

  private

  def action
    subject = bottles == 0 ? "it" : "one"
    "Take #{subject} down and pass it around"
  end

  def remaining_bottles
    "#{humanized_number} #{humanized_bottles} on the wall."
  end

end
