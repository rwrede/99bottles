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

  def initialize(bottles)
    @bottles = bottles
  end

  def to_s
    <<-VERSE
#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.
Take one down and pass it around, #{bottles - 1} #{singular_or_plural} of beer on the wall.
    VERSE
  end

  private

  attr_reader :bottles

  def singular_or_plural
    (bottles - 1) < 2 ? "bottle" : "bottles"
  end

end
