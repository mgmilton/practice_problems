gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    assert_equal 6, Scrabble.new.score("nice")
  end

  def test_it_can_score_an_empty_string
    assert_equal 0, Scrabble.new.score("")
  end

  def test_it_can_score_a_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_a_bonus
    assert_equal 84, Scrabble.new.score("jazzman")
  end

end
