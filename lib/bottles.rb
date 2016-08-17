class Bottles

  def verse(number)
    <<-VERSE
#{number} bottles of beer on the wall, #{number} bottles of beer.
Take one down and pass it around, #{number - 1} #{singular_or_plural(number - 1)} of beer on the wall.
    VERSE
  end

  private

  def singular_or_plural(number)
    number < 2 ? "bottle" : "bottles"
  end

end
