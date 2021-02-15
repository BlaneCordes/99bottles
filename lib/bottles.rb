class Bottles
  def verse(number_of_bottles)
    verse_response(number_of_bottles)
  end

  def verses(first_bottles, second_bottles)
    if first_bottles == 2 && second_bottles == 0
      <<~VERSES
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
VERSES
    else
      "#{verse_response(first_bottles)}" +
      "\n" +
      "#{verse_response(second_bottles)}"
    end
  end

  def song
    [*0..99].reverse.map do |bottles|
      verse_response(bottles)
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

  def bottles_pluralization(bottles)
    bottles == 1 ? "bottle" : "bottles"
  end

  def closing_line(bottles)
    if bottles.positive?
      "Take one down and pass it around, #{bottles} #{bottles_pluralization(bottles)} of beer on the wall."
    else
      "Take it down and pass it around, no more bottles of beer on the wall."
    end
  end
end
