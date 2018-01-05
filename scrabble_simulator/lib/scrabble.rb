class Scrabble

  def score(word)
    return 0 if word == nil
    letters = word.split("")
    letters << "bonus" if letters.length == 7
    letters.map do |letter|
      letter_scorer(letter)
    end.sum
  end

  def letter_scorer(letter)
    case point_values[letter.upcase]
    when nil then 0
    else
      point_values[letter.upcase]
    end
  end

  def score_with_multipliers(word, int)
    score(word) * int
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10, "BONUS" => 10
    }
  end
end
