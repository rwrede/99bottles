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
    @bottles_from = bottles_from
    @bottles_to = bottles_to
  end

  def to_s
    verses.map(&:to_s).join("\n")
  end

  private

  attr_reader :bottles_from, :bottles_to

  def verses
    @verses ||= bottles_from.downto(bottles_to).map { |b| Verse.new(b) }
  end

end

class Verse

  def initialize(bottles)
    @bottles = bottles
  end

  def to_s
    case bottles
    when 0
      fill_up
    when 1
      take_last_out
    else
      take_one_out
    end
  end

  private

  attr_reader :bottles

  def take_one_out
    <<-VERSE
#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.
Take one down and pass it around, #{bottles-1} #{bottles-1 > 1 ? "bottles" : "bottle" } of beer on the wall.
    VERSE
  end

  def take_last_out
    <<-VERSE
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
  end

  def fill_up
    <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end

end
