require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/artist'
require './lib/museum'
require './lib/photograph'

class CuratorTest < Minitest::Test

  def setup
    @curator = Curator.new
    @museum =  Museum.new({name: "Museo de Arte Moderno"})
    @artist = Artist.new({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    @photograph = Photograph.new({name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})
  end

  def test_artists_returns_array
    assert_equal [], @curator.artists
  end

  def test_museums_returns_array
    assert_equal [], @curator.museums
  end

  def test_photographs_returns_array
    assert_equal [], @curator.photographs
  end

  def test_add_museums_stores_instances_of_museum
    assert_instance_of Array, @curator.add_museum(@museum)
    assert_instance_of Museum, @curator.museums[0]
    assert_equal 1, @curator.museums.count
    assert_equal 1, @curator.museums.first.id
  end

  def test_add_artist_stores_instances_of_artists
    assert_instance_of Array, @curator.add_artist(@artist)
    assert_instance_of Artist, @curator.artists[0]
    assert_equal 1, @curator.artists.count
    assert_equal 1, @curator.artists.first.id
  end

  def test_add_museums_stores_instances_of_photographs
    assert_instance_of Array, @curator.add_photograph(@photograph)
    assert_instance_of Photograph, @curator.photographs[0]
    assert_equal 1, @curator.photographs.count
    assert_equal 1, @curator.photographs.first.id
  end

  def test_find_museum_locates_museum_by_id
    @curator.add_museum(@museum)
    museum = @curator.find_museum(1)

    assert_instance_of Museum, museum

    assert_equal "Museo de Arte Moderno", museum.name
  end

  def test_find_artist_locates_artist_by_id
    @curator.add_artist(@artist)
    artist = @curator.find_artist(1)

    assert_instance_of Artist, artist

    assert_equal "Ansel Adams", artist.name
  end

  def test_find_museum_by_photograph_returns_museum_where_photo_resides
    moma = Museum.new({name: "Metropolitan Museum of Art"})
    arbus = Artist.new({name: "Diane Arbus", born: 1923, died: 1971, country: "United States"})
    twins = Photograph.new({name: "Identical Twins, Roselle, New Jersey", artist_id: 1, museum_id: 1, year: 1967})

    @curator.add_museum(moma)
    @curator.add_artist(arbus)
    @curator.add_photograph(twins)
    photograph = @curator.photographs.first
    museum = @curator.find_museum_by_photograph(photograph)

    assert_instance_of Museum, @curator.find_museum_by_photograph(photograph)
    assert_equal 1, museum.id
  end

  def test_find_artist_by_photograph_returns_original_artist
    moma = Museum.new({name: "Metropolitan Museum of Art"})
    arbus = Artist.new({name: "Diane Arbus", born: 1923, died: 1971, country: "United States"})
    twins = Photograph.new({name: "Identical Twins, Roselle, New Jersey", artist_id: 1, museum_id: 1, year: 1967})

    @curator.add_museum(moma)
    @curator.add_artist(arbus)
    @curator.add_photograph(twins)
    photograph = @curator.photographs.first
    artist = @curator.find_artist_by_photograph(photograph)

    assert_instance_of Artist, artist
    assert_equal 1, artist.id
    assert_equal "Diane Arbus", artist.name
  end

end
