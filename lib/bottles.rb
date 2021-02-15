class Bottles
  def verse(number_of_bottles)
    verse_response(number_of_bottles)
  end

  def verses(start_of_range, end_of_range)
    [*end_of_range..start_of_range].reverse.map do |number_of_bottles|
      verse(number_of_bottles)
    end.join("\n")
  end

  def song
    [*0..99].reverse.map do |bottles|
      verse(bottles)
    end.join("\n")
  end

  def verse_response(number_of_bottles)
    if number_of_bottles.zero?
      <<~VERSE
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    else
      <<~VERSE
        #{number_of_bottles} #{bottles_pluralization(number_of_bottles)} of beer on the wall, #{number_of_bottles} #{bottles_pluralization(number_of_bottles)} of beer.
        #{closing_line(number_of_bottles - 1)}
      VERSE
    end
  end

  def closing_line(bottles)
    return "Take it down and pass it around, no more bottles of beer on the wall." if bottles.zero?

    "Take one down and pass it around, #{bottles} #{bottles_pluralization(bottles)} of beer on the wall."
  end

  private

  def bottles_pluralization(number_of_bottles)
    number_of_bottles == 1 ? "bottle" : "bottles"
  end
end
