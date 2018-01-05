require './lib/artist'
require './lib/museum'
require './lib/photograph'

class Curator
  attr_reader :artists, :museums, :photographs

  def initialize
    @artists = []
    @museums = []
    @photographs = []
    @museum_id = 1
    @artist_id = 1
    @photo_id = 1
  end

  def add_museum(museum)
    museum.id = @museum_id
    @museums << museum
    @museum_id += 1
    @museums
  end

  def add_artist(artist)
    artist.id = @artist_id
    @artists << artist
    @artist_id += 1
    @artists
  end

  def add_photograph(photograph)
    photograph.id = @photo_id
    @photographs << photograph
    @photo_id += 1
    @photographs
  end

  def find_museum(id)
    @museums.find {|museum| museum.id == id}
  end

  def find_artist(id)
    @artists.find {|artist| artist.id == id}
  end

  def find_museum_by_photograph(photograph)
    @museums.find {|museum| museum.id == photograph.museum_id}
  end

  def find_artist_by_photograph(photograph)
    @artists.find {|artist| artist.id = photograph.artist_id}
  end
end
