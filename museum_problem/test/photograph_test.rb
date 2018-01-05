require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'

class PhotographTest < Minitest::Test
  def setup
    @photograph = Photograph.new({name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: 4, museum_id: 2, year: 1954})
  end

  def test_photo_begins_with_no_id
    assert_nil @photograph.id
  end

  def test_photo_has_artist_id
    assert_equal 4, @photograph.artist_id
  end

  def test_photo_has_museum_id
    assert_equal 2, @photograph.museum_id
  end

  def test_photo_has_a_name
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @photograph.name
  end

  def test_photo_has_a_year
    assert_equal 1954, @photograph.year
  end
end
